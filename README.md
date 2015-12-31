# tmux-vim-bindings

#### General Key Bindings

- `Alt+a` (`M-a`) - prefix, used to issue commands. Most of the commands are bound to `Alt` key directly (e.g. `Alt+num` to change windows instead of `Alt+a num`).
- `Alt+a d` - detach
- `Alt+q` - list key bindings (hotkeys)
- `Alt+c` - tmux cmd prompt
- `Alt+m` - tmux man prompt

#### Session Key Bindings

- `Alt+e` (`M-e`) - list sessions

#### Windows Key Bindings

- `Alt+t` (`M-t`) - new window
- `Alt+\`` (`M-\``) - toggle last window
- `Alt+NUM`(`M-NUM`) - select window NUM (1-9)
- `Alt+s` (`M-s`) - split window horizontally
- `Alt+v` (`M-v`) - split window vertically
- `Alt+w` (`M-w`) - close window

#### Pane Key Bindings

- `Alt+Tab` (`M-Tab`) - toggle last pane
- `Alt+h/l/j/k` (`M-h/l/j/k`)  - pane selection (hljk)
- `Alt+Shift+h/l/j/k` (`M-H/L/J/K`) - pane resize
- `Alt+d` (`M-d`) - swap pane forward
- `Alt+Shift+d` (`M-D`) - swap pane backward
- `Alt+w` (`M-w`) - close pane

#### Optimizations

Minor `tmux` key optimizations*:
  - `Alt+a a` (`M-a a`) - fast switching between alternate Windows
  - `Alt+a r` (`M-a r`) - reload tmux configuration (source `~/.tmux.conf`)
