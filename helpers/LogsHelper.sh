#!/bin/sh
COLOR_OFF="\033[0m"
COLOR_RED="\033[0;31m"
COLOR_CYAN="\033[0;32m"
COLOR_YELLOW="\033[0;33m"

log() {
  TYPE_LOG=$1
  MESSAGE=$2
  case "$TYPE_LOG" in
  "ERROR")
    echo -e "$COLOR_RED$TYPE_LOG [$(date "+%Y-%m-%d %H:%M:%S")]: $COLOR_OFF$MESSAGE"
    ;;
  "INFO")
    echo -e "$COLOR_CYAN$TYPE_LOG [$(date "+%Y-%m-%d %H:%M:%S")]: $COLOR_OFF$MESSAGE"
    ;;
  "WARNING")
    echo -e "$COLOR_YELLOW$TYPE_LOG [$(date "+%Y-%m-%d %H:%M:%S")]: $COLOR_OFF$MESSAGE"
    ;;
  *)
    log "WARNING" "Log type not found"
    ;;
  esac
}
