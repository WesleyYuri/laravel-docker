#!/bin/sh

source helpers/LogsHelper.sh

build() {
  if test -e /bin/docker-compose; then
    if test -z "$(ls -la src)"; then
      log "INFO" "Init laravel project"
      log "INFO" "Create source folder"
      mkdir src
      log "INFO" "Finish create source folder"
      docker-compose run --rm --build composer create-project laravel/laravel .
      log "INFO" "Finish create laravel project"
    else
      log "WARNING" "Folder not empty"
    fi
  else
    log "WARNING" "You need install docker-compose binary file"
  fi
}

case "$1" in
build)
  build
  ;;
*)
  cat <<EOF
USAGE:
./run.sh <command>

COMMANDS:
build ....................... Create a source folder and laravel project

EOF
  exit
  ;;
esac
