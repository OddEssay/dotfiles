# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme is loaded from the homebrew installed spaceship, not ZSH_THEME
# export ZSH_THEME="spaceship" # Look in ~/.oh-my-zsh/themes/
if [ -f "/opt/homebrew/opt/spaceship/spaceship.zsh" ]; then
  source /opt/homebrew/opt/spaceship/spaceship.zsh
elif [ -f "/usr/local/opt/spaceship/spaceship.zsh" ]; then
  source /usr/local/opt/spaceship/spaceship.zsh
fi

export UPDATE_ZSH_DAYS=5
export HISTFILESIZE=100000
export HISTSIZE=100000
export SAVEHIST=100000

# DISABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# HIST_STAMPS="mm/dd/yyyy" # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

plugins=(git macos vagrant rails tmuxinator docker mix you-should-use asdf) # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

source $ZSH/oh-my-zsh.sh


# User configuration

export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

# Make navigation around my main file paths easier
cdpath=(~/ ~/Development ~/Development/patchwork)

# export LANG=en_US.UTF-8

# export SSH_KEY_PATH="~/.ssh/dsa_id" #ssh

alias ap="ansible-playbook"
alias vimrc="vim ~/dotfiles/vimrc"
alias vi=vim
alias zshrc="code ~/dotfiles/zshrc"
alias ls='ls -lahGP'
alias tm='tmuxinator'
alias tms='tmuxinator start'
alias code='code-insiders'

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
function gt() {
  read "dogt?Remove all untracked files and undo all uncommited changes?"

  if [[ "$dogt" =~ ^[Yy]$ ]]
  then
    eval "git checkout -- .; git clean -df"
    echo 'git Tidy complete'
  else
    echo 'Aborted'
  fi
}

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/paul/Dropbox/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/paul/Dropbox/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/paul/Dropbox/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/paul/Dropbox/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

alias dr="docker run --rm --interactive --tty"

source ~/dotfiles/env_secrets

for file in ~/dotfiles/shell-functions/*.zsh; do
    autoload -Uz "$(basename "$file" .zsh)"
    source "$file"
done


# Add NVM only if it's installed
[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Add RVM only if it's installed
[ -s "$HOME/.rvm/bin" ] && export PATH="$PATH:$HOME/.rvm/bin"

# pnpm
export PNPM_HOME="/Users/paul/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
