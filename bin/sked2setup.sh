#!/bin/sh

# Set Session Name
SESSION="sked2"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    tmux new-session -d -s $SESSION

    tmux send-keys -t $SESSION:1 "cd ~/Developer/sked/sked-v22/api; nix-shell --command \"fish\"" C-m

    tmux new-window -t $SESSION:2
    tmux send-keys -t $SESSION:2 "cd ~/Developer/sked/sked-v22/api; nix-shell --command \"fish\"" C-m

    tmux new-window -t $SESSION:3
    tmux send-keys -t $SESSION:3 "cd ~/Developer/sked/sked-v22/api; nix-shell --command \"fish\"" C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION
