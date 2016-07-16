tmux-vim-bindings
=================

[tmux-vim-bindings][0] is vim-compatible tmux bindings (hotkeys) configuration
as a TPM plugin. This plugin is compatible with [ek9/tmux-config][1] and
[ek9/vim-config][2].

**Note!** For an example config please check [tmux.conf in ek9/dotfiles][10].

## Requirements

- [tmux][3]
- [TPM][4]

## Install

Add plugin to the list of [TPM][4] plugins in `.tmux.conf`:

```
set -g @plugin 'ek9/tmux-vim-bindings'
```

Hit `prefix + I` to fetch the plugin and source it.

## Bindings

### General

- `Alt+a` (`M-a`) - prefix, used to issue commands. Most of the commands are
  bound to `Alt` key directly (e.g. `Alt+num` to change windows instead of
  `Alt+a num`).
- `Alt+a d` - detach
- `Alt+q` - list key bindings (hotkeys)
- `Alt+c` - tmux cmd prompt
- `Alt+m` - tmux man prompt

Minor `tmux` key optimizations:

- `Alt+a a` (`M-a a`) - fast switching between alternate Windows
- `Alt+a r` (`M-a r`) - reload tmux configuration (source `~/.tmux.conf`)

### Sessions

- `Alt+e` (`M-e`) - list sessions

### Windows

- `Alt+t` (`M-t`) - new window
- `Alt+\`` (`M-\``) - toggle last window
- `Alt+NUM`(`M-NUM`) - select window NUM (1-9)
- `Alt+s` (`M-s`) - split window horizontally
- `Alt+v` (`M-v`) - split window vertically
- `Alt+w` (`M-w`) - close window

### Panes

- `Alt+Tab` (`M-Tab`) - toggle last pane
- `Alt+h/l/j/k` (`M-h/l/j/k`)  - pane selection (hljk)
- `Alt+Shift+h/l/j/k` (`M-H/L/J/K`) - pane resize
- `Alt+d` (`M-d`) - swap pane forward
- `Alt+Shift+d` (`M-D`) - swap pane backward
- `Alt+w` (`M-w`) - close pane

## Authors

Copyright (c) 2015-2016 ek9 <dev@ek9.co> (https://ek9.co).

## License

Licensed under [MIT License](LICENSE).

[0]: https://github.com/ek9/tmux-vim-bindings
[1]: https://github.com/ek9/tmux-config
[2]: https://github.com/ek9/vim-config
[3]: https://github.com/tmux/tmux
[4]: https://github.com/tmux-plugins/tpm
[10]: https://github.com/ek9/dotfiles/blob/master/.tmux.conf
