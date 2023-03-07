#!/bin/zsh

# check if this command has 
if ! tmux has-session -t lifelink; then
  cd ~/lifelink
  # Launch all of the services
  tmux new -s lifelink -d
  tmux splitw -c ~/lifelink/kramer -l 10 
  tmux splitw -c ~/lifelink/pantry -l 10 
  tmux splitw -c ~/lifelink/services-api-grails5  -l 10
  tmux select-layout tiled
  tmux new-window
  tmux splitw -c ~/lifelink/fake-raven -l 10
  tmux splitw -c ~/lifelink/fake-aviator -l 10
  tmux splitw -c ~/lifelink/fake-auth-service -l 11
  tmux select-layout tiled
  tmux new-window -c ~/lifelink

  tmux send -t lifelink:1.0 "cd stanza && npm start" ENTER
  tmux send -t lifelink:1.1 "npm start" ENTER
  tmux send -t lifelink:1.3 "npm start" ENTER
  tmux send -t lifelink:3.0 lvim ENTER
  tmux send -t lifelink:2.0 "open http://localhost:10000/onboarding/esteban" ENTER
  tmux send -t lifelink:2.1 "npm start" ENTER
  tmux send -t lifelink:2.2 "npm start" ENTER
  tmux send -t lifelink:2.3 "npm start" ENTER


  tmux kill-pane -t lifelink:2.0
  tmux select-layout -t lifelink:2 tiled
  tmux select-layout -t lifelink:1 tiled
fi

if tmux ls | grep attached; then
  tmux switch-client -t lifelink
else
  tmux attach -t lifelink
fi
