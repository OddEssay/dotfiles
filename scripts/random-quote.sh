#!/bin/zsh

# Get a random quote from the quotes file
# if ~/quotes doesn't exist, use ~/dotfiles/quotes
if [ -f ~/quotes ]; then
    QUOTES_FILE=~/quotes
else
    QUOTES_FILE=~/dotfiles/quotes
fi
QUOTE=$(shuf -n 1 "$QUOTES_FILE")

# Limit the length for display purposes (adjust as needed)
echo "${QUOTE:0:80}"
