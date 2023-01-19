export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export ZK_NOTEBOOK_DIR="$HOME/Documents/my-vault/zettlekasten"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PNPM_HOME="$PATH:/Users/estebantrillo/.local/share/pnpm"

export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:$HOME/.amplify/bin"
export PATH="$PATH:$HOME/.jetbrains"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.config/nvim/lua-language-server/bin"
export PATH="$PATH:$HOME/.npm/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin/"
export PATH="$PATH:$PNPM_HOME"
export PATH="$PATH:/opt/homebrew/opt/node@16/bin"
export PATH="$PATH/usr/local/bin"

eval "$(zoxide init zsh)"
