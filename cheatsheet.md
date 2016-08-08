# Tmux
| Mapping | Notes |
| ---------- | --------------------------------- |
|   Ctrl+b   | ***Prefix***                            |
| _prefix_ % | ***Split*** new pane                    |
| _prefix_ o | ***Swap*** panes                        |
| _prefix_ z | ***Zoom*** pane                         |
| _prefix_ d | ***Detach*** session                    |
| _prefix_ s | list ***Sessions***                     |
| _prefix_ q # | Show pane numbers and jump to ***#*** |
|   Ctrl+d   | Increase pane size ***down***           |
|   Ctrl+u   | Decrease pane size ***up***             |
|   Ctrl+r   | ***Reload*** tmux config                |

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

# Vim Ruby Mappings
| Mapping    | Notes                                                 |
| ---------- | ----------------------------------------------------- |
| Leader + t | ***Test*** current file with rspec                    |
| Leader + s | Run nearest ***spec***                                |
| Leader + l | Run ***last*** spec                                   |
| Leader + a | Run ***all*** specs                                   |
|   gf     | ***Go*** to the ***file*** under                        |
| Ctrl+]   | Jump to file where class under cursor is defined        |

# Tmux Splits and Windows
| Mapping | Notes                       |
| ------- | --------------------------- |
| Ctrl+j  | Move to window on the left  |
| Ctrl+k  | Move to window on the right |
| Ctrl+l  | Move to window below        |
| Ctrl+h  | Move to window above        |

# Vim Leader Mappings
| Leader + | Notes                                                 |
| -------- | ----------------------------------------------------- |
|    p     | ***paste*** system clipboard with correct indentation |
|    h     | Clear ***highlighted*** search results                |
|    n     | Toggle ***numbers*** and ***marks*** in the gutter for copy/paste etc |

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

## Marks with Signature Plugin

| Mapping           | Notes                                       | 
|-------------------|---------------------------------------------|
| m<letter>         | Place a ***mark***                          |
| m<number>         | Place a Signature ***mark***                |
| \`<letter|number> | Jump to ***mark***                          |
| m/                | Display all alpha ***marks*** in buffer     |
| m?                | Display all Signature ***marks*** in buffer |
| m-                | Remove ***marks*** on line                  |
| m<space>          | Remove all ***marks*** in buffer            |

# Editing

| Insert Mode Mapping   | Notes |
| --------------------- | ----- |
| Ctrl+r = *expression* | Inserts the ***result*** of ***expression*** |
| dit                   | ***delete*** ***inside*** HTML ***tag*** |
|  Ctrl+_               | Close ***unclosed***  HTML tag           |

## Abolish
| Abolish Command | Notes |
| --------------- | ----- |
| :%Subvert/facilit{y,ies}/building{,s}/g | Replace ***facilit***y with ***building***, facilit***ies*** with building***s*** |
