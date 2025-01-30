#!/bin/sh

# Set Session Name
SESSION="sked"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Create and setup pane for hugo server
    tmux send-keys -t $SESSION:1 "cd ~/Developer/sked/sked-v2/api" C-m

    # setup Writing window
    tmux new-window -t $SESSION:2
    tmux send-keys -t $SESSION:2 "cd ~/Developer/sked/sked-v2/api" C-m

    # Setup an additional shell
    tmux new-window -t $SESSION:3
    tmux send-keys -t $SESSION:3 "cd ~/Developer/sked/sked-v2/api" C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION
