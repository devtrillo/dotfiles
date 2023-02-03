
#!/bin/zsh

if ! tmux has-session -t blog; then
  cd ~/Documents/blog

  tmux new -s blog -d
  tmux new-window

  tmux send -t blog:1.0 "yarn dev" ENTER
  tmux send -t blog:2.0 "open http://localhost:1111" ENTER
  tmux send -t blog:2.0 "lvim" ENTER

fi

tmux attach -t blog
