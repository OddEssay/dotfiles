#!/bin/zsh
export PATH="$PATH:/usr/local/bin:/opt/homebrew/bin"

SESSION_NAME="ghostty"

# Check if the session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
  # If the session exists, reattach to it
  exec tmux attach-session -t $SESSION_NAME
else
  # If the session doesn't exist, start a new one
  exec tmux new-session -s $SESSION_NAME
fi
