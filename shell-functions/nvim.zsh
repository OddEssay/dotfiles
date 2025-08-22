nvim() {
  # If nvim is called without arguments, use fzf to open one or more files
  # Use fd to filter out thing that are .gitignored
  if [ $# -eq 0 ]; then
    fd --type f --hidden --follow --exclude .git | fzf --multi --bind 'enter:become(nvim {+})'
  else
    command nvim "$@"
  fi
}
