#!/bin/zsh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
FOLDER_TO_BACKUP="/Users/dharmin/Dev"
LOG_FILE="/Users/dharmin/scripts/backup.log"

log_error() {
    local error_message="$1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $error_message" >> "$LOG_FILE"
}

ping -c 1 github.com > /dev/null 2>&1
if [ $? -ne 0 ]; then
    log_error "Backup failed - No internet connection"
    osascript -e 'display notification "Backup failed due to no internet connection" with title "Backup Failed" sound name "Chord"'
    exit 1
fi

cd "$FOLDER_TO_BACKUP" || {
    log_error "Backup failed - Unable to access backup directory: $FOLDER_TO_BACKUP"
    osascript -e 'display notification "Backup failed - Unable to access backup directory" with title "Backup Failed" sound name "Chord"'
    exit 1
}

git add . || {
    log_error "Backup failed - Git add operation failed"
    osascript -e 'display notification "Backup failed - Git add operation failed" with title "Backup Failed" sound name "Chord"'
    exit 1
}

commit_message="Automated backup $(date +"%Y-%m-%d %H:%M:%S")"
git commit -m "$commit_message" || {
    log_error "Backup failed - Git commit operation failed"
    osascript -e 'display notification "Backup failed - Git commit operation failed" with title "Backup Failed" sound name "Chord"'
    exit 1
}

git push origin main || {
    log_error "Backup failed - Git push operation failed"
    osascript -e 'display notification "Backup failed - Git push operation failed" with title "Backup Failed" sound name "Chord"'
    exit 1
}

osascript -e 'display notification "Automated Backup of dev folder is successfully executed." with title "Backup Successful" sound name "Chord"'

exit 0
