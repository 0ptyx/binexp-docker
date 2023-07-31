#!/bin/bash
#
#
#

usage() {
  echo "./run.sh <start|stop>"
  echo "    ./run.sh start <target>     Start the container with <target>"
  echo "    ./run.sh stop               Stop the container"
}

if [ "$1" == "start" ]; then
  if [[ -z "$2" ]]; then
    usage
    exit
  fi
  echo "Starting.."
  sudo BIN_TARGET=$2 docker compose up --build -d 
elif [ "$1" == "stop" ]; then
  echo "Stoping.."
  sudo docker compose down
else 
  usage
  exit
fi






