# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dstufft" # Look in ~/.oh-my-zsh/themes/

export UPDATE_ZSH_DAYS=5

# DISABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# HIST_STAMPS="mm/dd/yyyy" # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

plugins=(git osx vagrant rails) # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:~/npm/bin:~/npm/lib/node_modules"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Make navigation around my main file paths easier
cdpath=(~/ ~/Development ~/Development/lovefruitful)

# export LANG=en_US.UTF-8

# export SSH_KEY_PATH="~/.ssh/dsa_id" #ssh

alias ap="ansible-playbook"
alias vim="/usr/local/Cellar/vim/7.4.488/bin/vim" # Point vim at the version I want to load
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH" #homebrew PHP Version
alias vimrc="vim ~/dotfiles/vimrc"
alias zshrc="vim ~/dotfiles/zshrc"

# Shortcut to run vagrant ssh -c in the right context
function vudo() { eval "vagrant ssh -c \"cd /vagrant && $@\"" }

# Handle Composer and clean caches
function cu() { eval "vudo php -d memory_limit=-1 /usr/local/bin/composer update '$@'; vudo rm -f tmp/*.php" }

# Stop auto changing to directories because it's annoying
unsetopt AUTO_CD
