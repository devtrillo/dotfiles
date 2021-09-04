#!/usr/bin/env bash


DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
  echo -e "${COLOR_GRAY}==============================${COLOR_NONE}"
  echo -e "${COLOR_PURPLE}$1${COLOR_NONE}"
  echo -e "${COLOR_GRAY}==============================${COLOR_NONE}"
}

error() {
  echo -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
  exit 1
}

warning() {
  echo -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
}

info() {
  echo -e "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
  echo -e "${COLOR_GREEN}$1${COLOR_NONE}"
}

setup_tmux(){
  mkdir -p "$HOME/.tmux/plugins"
  if [ ! -d "$HOME/.tmux/plugins/tmp" ];then
    git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  TMUX_FILE=$HOME/.config/tmux/tmux.conf
  if [ -f "$TMUX_FILE" ]; then
    info "$TMUX_FILE exists, creating a backup"
    cp $TMUX_FILE $TMUX_FILE.backup
  fi
  ln -sfv $DOTFILES/config/tmux/tmux.conf $TMUX_FILE
  if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    tmux source-file $TMUX_FILE
  fi

}
setup_git() {
  title "Setting up Git"

  git config --global user.email "esteban@devtrillo.com"
  git config --global user.name "Esteban Trillo"

  if [[ "$(uname)" == "Darwin" ]]; then
    git config --global credential.helper "osxkeychain"
  else
    read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
    if [[ $save =~ ^([Yy])$ ]]; then
      git config --global credential.helper "store"
    else
      git config --global credential.helper "cache --timeout 3600"
    fi
  fi
}

setup_homebrew() {
  title "Setting up Homebrew"

  if [[ "$(uname)" == "Darwin" ]]; then
    if test ! "$(command -v brew)"; then
      info "Homebrew not installed. Installing."
      # Run as a login shell (non-interactive) so that the script doesn't pause for user input
      curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
    fi
    # install brew dependencies from Brewfile
    brew bundle
    # install fzf
    echo -e
    info "Installing fzf"
    "$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
  else 
    error "You are not running MacOS"
  fi

}
setup_ubuntu(){
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt install git git-flow zsh tmux wget curl tree  -y
  
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  
  title "Installing neovim"
  sudo add-apt-repository ppa:neovim-ppa/unstable  -y
  sudo apt update
  sudo apt-get install neovim

}

function setup_shell() {
  title "Configuring shell"

  curl -sS https://webinstall.dev/zoxide | bash


  [ ! -d "$HOME/.zshrc" ]
  ZSHFILE=$HOME/.zshrc
  if [ -f "$ZSHFILE" ]; then
    info "$ZSHFILE exists, creating a backup"
    mv $ZSHFILE $ZSHFILE.backup
  fi


    echo "export XDG_CONFIG_HOME=$HOME/.config" >> ~/.zshrc
    echo "export XDG_DATA_HOME=$HOME/.local/share" >> ~/.zshrc
    echo "export XDG_CACHE_HOME=$HOME/.cache" >> ~/.zshrc
    echo "" >> ~/.zshrc
    echo "source $HOME/.config/zsh" >> ~/.zshrc


  mkdir -p ~/.config/zsh

  
 for file in $(find -H "$DOTFILES/config/zsh" -maxdepth 4 -name '*'); do
    relative=$DOTFILES/config/zsh
    numbers="${#relative}"
    ln -sfv $file "$HOME/.config/zsh${file:$numbers}"
  done


}

function setup_neovim(){
  title "Setting up neovim"
  if [ -d "$HOME/.config/nvim" ]; then
    info "There is a neovim config, creating backup to $HOME/backup-neovim"
    rm -rf $HOME/backup-neovim 
    mv -f $HOME/.config/nvim $HOME/backup-neovim
  fi

  if [ ! $(command -v nvim) ]; then
    error "NeoVim is not installed"
    error "Please run install.sh homebrew to install it"
    return
  fi

  bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/master/utils/installer/install.sh)

  info "Linking config files"
  ln -sfv $DOTFILES/config/wakatime.cfg.symlink $HOME/.wakatime.cfg
  ln -sfv $DOTFILES/config/nvim/lv-config.lua $HOME/.config/nvim/lv-config.lua
}

function setup_terminfo() {
  title "Configuring terminfo"

  info "adding tmux.terminfo"
  tic -x "$DOTFILES/resources/tmux.terminfo"

  info "adding xterm-256color-italic.terminfo"
  tic -x "$DOTFILES/resources/xterm-256color-italic.terminfo"
}

setup_macos() {
  title "Configuring macOS"
  if [[ "$(uname)" == "Darwin" ]]; then

    echo "Finder: show all filename extensions"
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    echo "show hidden files by default"
    defaults write com.apple.Finder AppleShowAllFiles -bool false

    echo "only use UTF-8 in Terminal.app"
    defaults write com.apple.terminal StringEncodings -array 4

    echo "expand save dialog by default"
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

    echo "show the ~/Library folder in Finder"
    chflags nohidden ~/Library

    echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
    defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

    echo "Enable subpixel font rendering on non-Apple LCDs"
    defaults write NSGlobalDomain AppleFontSmoothing -int 2

    echo "Use current directory as default search scope in Finder"
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    echo "Show Path bar in Finder"
    defaults write com.apple.finder ShowPathbar -bool true

    echo "Show Status bar in Finder"
    defaults write com.apple.finder ShowStatusBar -bool true

    echo "Disable press-and-hold for keys in favor of key repeat"
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

    echo "Set a blazingly fast keyboard repeat rate"
    defaults write NSGlobalDomain KeyRepeat -int 1

    echo "Set a shorter Delay until key repeat"
    defaults write NSGlobalDomain InitialKeyRepeat -int 15

    echo "Enable tap to click (Trackpad)"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

    echo "Enable Safari’s debug menu"
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

    echo "Kill affected applications"

    for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
  else
    warning "macOS not detected. Skipping."
  fi
}

title "Welcome to my aweomse installer"
case "$1" in
  tmux)
    setup_tmux
    ;;
  git)
    setup_git
    ;;
  homebrew)
    setup_homebrew
    ;;
  shell)
    setup_shell 
    ;;
  terminfo)
    setup_terminfo 
    ;;
  ubuntu)
    setup_ubuntu
    setup_shell
    setup_neovim
    setup_git
    setup_tmux
    ;;
  neovim)
    setup_neovim 
    ;;
  macos)
    setup_shell
    setup_neovim
    setup_macos
    setup_terminfo
    setup_homebrew
    setup_git
    ;;
  *)
    echo -e $"\nUsage: $(basename "$0") {neovim|git|homebrew|shell|terminfo|macos}\n"
    exit 1
    ;;
esac

echo -e
success "Done."
