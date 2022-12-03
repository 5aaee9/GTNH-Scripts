#!/usr/bin/env bash

TMUX_SESSION="$TMUX_MAIN_SESSION:$TMUX_SERVER_SESSION_NAME"

function log() {
    echo [$(date)] INFO: $1
}

function waitText() {
    while true; do
        tmux capture-pane -t $TMUX_SESSION -p | tail -n 3 | grep "$1" && return 0
    done
}

function sendCommand() {
    tmux send-keys -t $TMUX_SESSION "$1" C-m
}

function playerCount() {
    sendCommand "list"
    waitText "players online" | awk '{print $5}' | awk -F "/" '{print $1}'
}

function commandSay() {
    sendCommand "say $1"
}

function runBackup() {
    log "start backuping servers"
    start=`date +%s`
    if [ $(playerCount) -eq 0 ]; then
        log "No player online"
        return 0
    fi

    sendCommand "save-off"
    waitText "CONSOLE: Disabled level saving"
    sendCommand "save-all flush"
    waitText "CONSOLE: Save complete."

    restic -p $BACKUP_PASSWORD_FILE -r $BACKUP_DEST backup $BACKUP_SRC_DIR --tag $BACKUP_TAGS
    
    sendCommand "save-on"

    end=`date +%s`
    runtime=$(echo "$end - $start" | bc -l)

    format_time="$(($runtime / 3600))hrs $((($runtime / 60) % 60))min $(($runtime % 60))sec"
    commandSay "Server backup done - $format_time"
}

runBackup