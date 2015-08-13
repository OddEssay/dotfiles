# Tmux
| Mapping | Notes |
| ------- | ----- |
| Ctrl+b  | ***Prefix*** |
| _prefix_ % | ***Split*** new pane |
| _prefix_ o | ***Swap*** panes |
| _prefix_ z | ***Zoom*** pane |
| _prefix_ d | ***Detach*** session |
| _prefix_ s | list ***Sessions*** |
| _prefix_ q # | Show pane numbers and jump to ***#*** |

# SSH
| Mapping | Notes |
| ------- | ----- |
| Enter ~ . | Escape sequence to kill hung connections (Or just exit) |
| Enter ~ ? | Escape sequence to list available escape options |

# Movement and Navigation
`Ctrl+w` = Move to ***window***

`g;`     = ***Go to*** last edit location (works across close/reopen)

## Ruby Motions
`]m`     = Next ***method*** definition

`[m`      = Previous ***method*** definition

`]M`     = Next ***method end*** of definition

`[M`     = Previous ***method end*** of definition

## vim-ruby mappings
`gf`     = ***Go*** to the ***file*** under

`Ctrl+]` = Jump to file where class under cursor is defined

# Tmux Splits and Windows
| Mapping | Notes                       |
| ------- | --------------------------- |
| Ctrl+j  | Move to window on the left  |
| Ctrl+k  | Move to window on the right |
| Ctrl+l  | Move to window below        |
| Ctrl+h  | Move to window above        |
# Leader Mappings
`p`      = ***paste*** system clipboard with correct indentation

# CtrlP
***Full Mappings*** :h ctrlp-mappings

| Mapping | Notes                                     |
| ------- | ----------------------------------------- |
| Ctrl+k  | Move ***up*** in result list              |
| Ctrl+j  | Move ***down*** in result list            |
| Ctrl+p  | ***previous*** search                     |
| Ctrl+n  | ***next*** search                         |
| Ctrl+s  | Open result in a new ***split***          |
| Ctrl+v  | Open result in a new ***vertical*** split |
| Ctrl+t  | Open result in a new ***tab***            |


# Fugitive
`:Gdiff`   = View ***g***it ***diff***

`:Gstatus` = View ***g***it ***status***

`-`        = Stage/unstage file in status output

`:Gread`   = ***Read*** file from git (Akin to git checkout --)

# Editing

| Insert Mode Mapping   | Notes |
| --------------------- | ----- |
| Ctrl+r = *expression* | Inserts the ***result*** of ***expression** |
