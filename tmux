set -g base-index 1
set -g renumber-windows on
bind-key C-j choose-tree
bind-key - split-window -v  -c '#{pane_current_path}'
bind-key \ split-window -h  -c '#{pane_current_path}'
