# Check if dot files git repo is up to date once a day

#  [[ ! -f ~/.last_dotfiles_check ]]: Check returns true if the file .last_dotfiles_check does not exist in the home directory.

# $(date +%s): Returns the current timestamp in seconds since the epoch (Unix time).
# $(stat -f%c ~/.last_dotfiles_check): Returns the last modification time (in seconds since the epoch) of the .last_dotfiles_check file.
# expr $(date +%s) - $(stat -f%c ~/.last_dotfiles_check): Calculates the time difference between the current time and the last modification time of the .last_dotfiles_check file in seconds.
# -ge 86400: Checks if the time difference (in seconds) is greater than or equal to 86400 seconds (1 day).

if [[ ! -f ~/.last_dotfiles_check ]] || [[ $(expr $(date +%s) - $(stat -f%c ~/.last_dotfiles_check)) -ge 86400 ]]; then
    cd ~/dotfiles
    git fetch
    if [[ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]]; then
        echo "  👋"
        echo "    dotfiles repo is not up to date! 👀"
    fi
    touch ~/.last_dotfiles_check
fi