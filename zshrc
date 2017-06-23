# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dstufft" # Look in ~/.oh-my-zsh/themes/

export UPDATE_ZSH_DAYS=5

# DISABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# HIST_STAMPS="mm/dd/yyyy" # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

plugins=(git osx vagrant rails tmuxinator) # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/terminal-colours.sh

# User configuration

export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:~/npm/bin:~/npm/lib/node_modules"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Make navigation around my main file paths easier
cdpath=(~/ ~/Development ~/Development/lovefruitful ~/Development/yozu)

# export LANG=en_US.UTF-8

# export SSH_KEY_PATH="~/.ssh/dsa_id" #ssh

alias ap="ansible-playbook"
alias vimrc="vim ~/dotfiles/vimrc"
alias vi=vim
alias zshrc="vim ~/dotfiles/zshrc"
alias ls='ls -lahGP'
alias tm='tmuxinator'
alias tms='tmuxinator start'

# Shortcut to run vagrant ssh -c in the right context
function vudo() { eval "vagrant ssh -c \"cd /vagrant && $@\"" }

alias vs="vagrant ssh" # Jump into Vagrant

# Handle Composer and clean caches
function cu() { eval "vudo php -d memory_limit=-1 /usr/local/bin/composer update '$@'; vudo rm -f tmp/*.php" }

alias syncb="bundle install; vagrant ssh -c 'cd /vagrant; bundle install'"

# Stop auto changing to directories because it's annoying
unsetopt AUTO_CD

# Copy the .git_template hooks into the current repo. -R to Ensure symlinks
alias rehook="cp -R ~/.git_template/hooks/* .git/hooks"

# Shortcut to run diff-so-fancy with git
alias dsf="git diff --color | diff-so-fancy"

# Shortcut to undo all changes with git
alias gt="git checkout -- .; git clean -df"

# Open a BitBucket Pull Request
function bbpr() { eval "open https://bitbucket.org/$(git remote -v | head -n1 | awk '{print $2}' | sed -e 's,.*:\(.*/\)\?,,' -e 's/\.git$//' | sed -e 's/.*://')/pull-requests/new\?source\=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')\&dest=develop" }


# Open a GitHub Pull Request
# https://github.com/sealevelresearch/vantage/compare/develop...feature/location-loading?expand=1

function ghpr() {  eval "open https://github.com/$(git remote -v | head -n1 | awk '{print $2}' | sed -e 's,.*:\(.*/\)\?,,' -e 's/\.git$//' | sed -e 's/.*://')/compare/develop...$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')\?expand\=1"}

# Run ABC Checks on ruby
function abc() { eval "flog $@; excellent $@" }

export EDITOR=vim
export PATH="/usr/local/sbin:$PATH"

# HT http://superuser.com/questions/415650/does-a-fuzzy-matching-mode-exist-for-the-zsh-shell
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

alias psg="ps aux | grep"
