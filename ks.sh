#!/bin/bash

# Check if the correct number of arguments were provided
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <start|kill> <process_name> [<command_to_start>]"
  exit 1
fi

ACTION=$1
PROCESS_NAME=$2

# Function to start a process
start_process() {
  COMMAND=$1
  # Start the process in the background
  $COMMAND &
  # Get the PID of the last background process
  PID=$!
  echo "Process $PROCESS_NAME started with PID: $PID"
}

# Function to kill a process
kill_process() {
  # Get the process ID (PID) of the specified process
  PID=$(pgrep -f "$PROCESS_NAME")
  
  # Check if the process is running
  if [ -z "$PID" ]; then
    echo "No process found with name: $PROCESS_NAME"
    exit 1
  fi
  
  # Kill the process
  kill $PID
  
  # Check if the kill command was successful
  if [ $? -eq 0 ]; then
    echo "Process $PROCESS_NAME (PID: $PID) has been killed."
  else
    echo "Failed to kill the process $PROCESS_NAME (PID: $PID)."
    exit 1
  fi
}

# Perform the action based on the first argument
case $ACTION in
  start)
    if [ -z "$3" ]; then
      echo "You must provide a command to start the process."
      exit 1
    fi
    COMMAND=$3
    start_process "$COMMAND"
    ;;
  kill)
    kill_process
    ;;
  *)
    echo "Invalid action. Use 'start' or 'kill'."
    exit 1
    ;;
esac

