
# GIT
alias g="git"
alias lg="lazygit"
alias ga="git add"
alias gclean="git remote prune origin && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}');do git branch -D $branch; done"
alias gs="git status"
alias gc="git commit"
alias gp="git push -u origin HEAD"
alias gP="git pull"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#NVM
alias save-nvm-version="node -v > .nvmrc"

#NVM
alias vsc="code ."

#NPM
alias npm-check-updates="npx npm-check-updates -i -u"


#LIFELINK
alias mfa='~/lifelink/ops/mfa.sh'
alias startAll='cd ~/lifelink/getstarted/; ./startAll.sh'

alias gh-pr-vail="gh pr create -a @me -B develop -r AMorua,Dazuam"
alias gh-pr-platform="gh pr create -a "@me" -B master -r azimmer,bryan-lifelink,justinwiley,lifelinkpaul,monkeysaa,shoshanaedelman"

alias tmux-new="tmux new -s $(basename `pwd`)"
