# Tmux config
export TMUX_MAIN_SESSION="Minecraft"
export TMUX_SERVER_SESSION_NAME="Main"
export TMUX_BACKUP_SESSION_NAME="Backup"

# Backup config

## backup interval, 600 = 10m
export BACKUP_INTERVAL=600
## restic backup target
export BACKUP_DEST="/mnt/share/Backups/Restic/"
## restic backup tags
export BACKUP_TAGS="GTNH"
## backup from
export BACKUP_SRC_DIR="$PWD/World"
## password file
export BACKUP_PASSWORD_FILE="/root/RESTIC_PASSWORD"

# Server start config
## core jar
export SERVER=Thermos-1.7.10-1614-server.jar
## restart wait
export RESTART_TIMEOUT=10
## min use memory
export MIN_MEN=2G
## max use memory
export MAX_MEM=14G
## java options
export JAVA_OPTS="-Dcom.sum.management.jmxremote -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"

