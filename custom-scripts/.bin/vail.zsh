#!/bin/zsh

if ! tmux has-session -t vail; then
  cd ~/lifelink/vail

  tmux new -s vail -d
  tmux new-window

  tmux send -t vail:1.0 "npm run dev" ENTER
  tmux send -t vail:2.0 "open http://localhost:3000" ENTER
  tmux send -t vail:2.0 "lvim" ENTER

fi

tmux attach -t vail
