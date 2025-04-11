#!/bin/bash

# Conf Variables
Src_dir=/nonexistent
backup_dir="/backups"
ret_days=7
log_dir="/var/log/backups"
log_ret=5
backup_name="backup-$(date +%Y%m%d_%H%M%s).tar.gz"
log_file="$log_dir/backup-$(date +%Y%m%d_%H%M%s).log"
email_recipient="admin@server.local"
email_sender="backup@server.local"

mkdir -p "$backup_dir" "$log_dir"

log_msg() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$log_file"
}

send_alert(){
    local subject="$1"
    local message="$2"
    echo "$message" | mail -s "$subject" -r "$email_sender" "$email_recipient"
}

log_msg "starting backup of $src_dir"

if tar -czf "$backup_dir/$backup_name" "$src_dir" 2>/dev/null; then
    log_msg "$backup_name successfully created"
else 
    log_msg "failed to create backup"
    send_alert "failure backup - $(date '+%Y-%m-%d')" "backup of $src_dir failed. check $log_file for details."
    exit 1    
fi 

if [ ! -f "$backup_dir/$backup_name" ]; then
    log_msg "backup file $backup_name not found"
    send_alert "failure backup - $(date '+%Y-%m-%d')" "backup file $backup_name was not created. check $log_file."
    exit 1
fi

find "$backup_dir" -name "backup-*.tar.gz" -mtime +"$ret_days" -delete
log_msg "removed backups older than $ret_days days"

ls -t "$log_dir"/backup-*.log 2>/dev/null | tail -n +"$log_ret" | xargs -r rm -f
log_msg "rotated logs, keeping last $log_ret logs"

log_msg "backup process completed successfully"
exit 0