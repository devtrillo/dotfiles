# Loads correctly spaceship prompt
# if [ ! -d "$ZDOTDIR/plugins/spaceship-prompt" ]; then 
#     title "Setting up the prompt"
#     git clone https://github.com/spaceship-prompt/spaceship-prompt.git $ZDOTDIR/plugins/spaceship-prompt --depth=1
# fi

# we need to source it this way because the plugin is not using naming convention
# source $ZDOTDIR/plugins/spaceship-prompt/spaceship.zsh
#
#
# plug "zap-zsh/zap-prompt"

plug "romkatv/powerlevel10k"
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


