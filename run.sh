#!/usr/bin/env bash

source config.sh

# Start New Session with our name
tmux new-session -d -s $TMUX_MAIN_SESSION

# Server thread
tmux rename-window -t 0 $TMUX_SERVER_SESSION_NAME
tmux send-keys -t $TMUX_SERVER_SESSION_NAME 'bash -c "source config.sh; bash serverscripts/startserver.sh"' C-m

# Backup thread
tmux new-window -t $TMUX_MAIN_SESSION:1 -n $TMUX_BACKUP_SESSION_NAME
tmux send-keys -t $TMUX_BACKUP_SESSION_NAME "bash -c 'source config.sh; while true; do bash serverscripts/backup.sh; sleep $BACKUP_INTERVAL; done'" C-m