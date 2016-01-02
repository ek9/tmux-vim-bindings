#!/usr/bin/env bash
# tmux-vim-bindings
# Sets <Alt+a> key as prefix. While configuring keybinds, you can rely on <Alt>
# key to execute most commands (e.g. window switching).

# <keys>    <description>
# M         <Alt> (Meta key)
# M-d       <Alt+d> (Meta key + d)
# C         prefix (<Alt+a>)
# C-d       prefix + d (<Alt+a d>)
main() {

### Setup
### Setup required options and unbind all keys

    # address vim mode switching delay (http://superuser.com/a/252717/65504)
    tmux set-option -s escape-time 0

    # fix issues with Shift+PgUp/PgDn scrolling
    tmux set-option -g terminal-overrides 'xterm*:smcup@:rmcup@'

    # unbind unused default keys
    #tmux unbind-key -a

    # <Alt+a> as prefix
    tmux set-option -g prefix M-a

### Generic Hotkeys
###

    # <Alt+A> as prefix
    tmux bind-key M-a       send-prefix
    tmux bind-key -n C-a       send-prefix


    # <Alt+r> reload tmux config (source-file ~/.tmux.conf)
    tmux bind-key -n M-r    run-shell ' \
        tmux source-file ~/.tmux.conf; \
        tmux display-message "Sourced .tmux.conf!"'
    # <prefix r> reload tmux config (source-file ~/.tmux.conf)
    tmux bind-key -T prefix r         run-shell ' \
        tmux source-file ~/.tmux.conf; \
        tmux display-message "Sourced .tmux.conf!"'

    # <Alt+n> tmux cmd prompt
    tmux bind-key -n M-"n"    command-prompt -p "tmux:"
    tmux bind-key -T prefix n           command-prompt -p "tmux:"
    # <Alt+m> man prompt
    tmux bind-key -n M-"m"    command-prompt -p "man:" "split-window -h 'man %%'"
    tmux bind-key -T prefix "m"         command-prompt -p "man:" "split-window -h 'man %%'"


    # <Alt+/> list keys
    tmux bind-key -n M-/    list-keys

### Session Hotkeys
###
    # <Alt+e> list sessions
    tmux bind-key -n M-e    list-sessions
    tmux bind-key e list-sessions

    # <Alt+t> rename session
    tmux bind-key -n M-t  command-prompt -I \#S "rename-session '%%'"
    tmux bind-key t   command-prompt -I \#S "rename-session '%%'"

### Window Hotkeys
###

    # <Alt+w> list windows
    tmux bind-key -n M-w    list-windows
    tmux bind-key -T prefix w list-windows

    # <Alt-\`> toggle last window
    tmux bind-key -n M-\`   last-window

    # <Alt+c> new window
    tmux bind-key -n M-c    new-window

    # <prefix w> kill window(s)/pane(s) (repeatable)
    tmux bind-key -n M-x  confirm-before kill-pane

    # <Alt+s> split window vertically
    tmux bind-key -n M-s    split-window -v
    tmux bind-key -T prefix s         split-window -v

    # <Alt+v> split window horizontally
    tmux bind-key -n M-v    split-window -h
    tmux bind-key -T prefix v         split-window -h

    # <Alt+w> select window
    tmux bind-key -n M-"'"  command-prompt -p index "select-window -t ':%%'"

    # <Alt+Num> select windows
    tmux bind-key -n M-1    select-window -t 1
    tmux bind-key -T prefix 1         select-window -t 1
    tmux bind-key -n M-2    select-window -t 2
    tmux bind-key -T prefix 2         select-window -t 2
    tmux bind-key -n M-3    select-window -t 3
    tmux bind-key -T prefix 3         select-window -t 3
    tmux bind-key -n M-4    select-window -t 4
    tmux bind-key -T prefix 4         select-window -t 4
    tmux bind-key -n M-5    select-window -t 5
    tmux bind-key -T prefix 5         select-window -t 5
    tmux bind-key -n M-6    select-window -t 6
    tmux bind-key -T prefix 6         select-window -t 6
    tmux bind-key -n M-7    select-window -t 7
    tmux bind-key -T prefix 7         select-window -t 7
    tmux bind-key -n M-8    select-window -t 8
    tmux bind-key -T prefix 8         select-window -t 8
    tmux bind-key -n M-9    select-window -t 9
    tmux bind-key -T prefix 9         select-window -t 9
    tmux bind-key -n M-0    select-window -t 10
    tmux bind-key -T prefix 0         select-window -t 10

    # <Alt+-> select window 11
    tmux bind-key -n M-"-"  select-window -t 11
    tmux bind-key -T prefix "-"       select-window -t 1

    # <Alt+=> select window 12
    tmux bind-key -n M-"="  select-window -t 12
    tmux bind-key -T prefix "="       select-window -t 1

### Pane Hotkeys
###
    # <Alt+Tab> toggle last pane
    tmux bind-key -n M-Tab last-pane

    # <Alt+h/l/j/k> pane selection
    tmux bind-key -n M-h   select-pane -L
    tmux bind-key -n M-l   select-pane -R
    tmux bind-key -n M-j   select-pane -D
    tmux bind-key -n M-k   select-pane -U

    # <Alt+Left/Right/Down/Up> pane resize
    # -r argument makes it repeatable
    tmux bind-key -n M-'Left'           resize-pane -L 5
    tmux bind-key -r -T prefix 'Left'   resize-pane -L 5
    tmux bind-key -n M-'Right'          resize-pane -R 5
    tmux bind-key -r -T prefix 'Right'  resize-pane -R 5
    tmux bind-key -n M-'Down'           resize-pane -D 5
    tmux bind-key -r -T prefix 'Down'   resize-pane -D 5
    tmux bind-key -n M-'Up'             resize-pane -U 5
    tmux bind-key -r -T prefix 'Up'     resize-pane -U 5

    # <Alt+.> swap pane backward
    tmux bind-key -n M-"."   swap-pane -D
    # <Alt+,> swap pane forward
    tmux bind-key -n M-","   swap-pane -U

}
main
