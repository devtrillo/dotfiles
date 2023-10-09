if command -v rg > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi

if command -v nvim > /dev/null 2>&1; then
    export EDITOR='nvim'
fi

