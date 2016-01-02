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
    # address vim mode switching delay (http://superuser.com/a/252717/65504)
    tmux set-option -s escape-time 0

    # fix issues with Shift+PgUp/PgDn scrolling
    tmux set-option -g   terminal-overrides 'xterm*:smcup@:rmcup@'

    # unbind all keys
    unbind-key -a

    # set <Alt+A> as prefix
    tmux set-option -g   prefix M-a
    tmux bind-key M-a    send-prefix
    tmux bind-key -n C-a send-prefix

    # <Alt+Num> select windows
    tmux bind-key -n M-1   select-window -t 1
    tmux bind-key -n M-2   select-window -t 2
    tmux bind-key -n M-3   select-window -t 3
    tmux bind-key -n M-4   select-window -t 4
    tmux bind-key -n M-5   select-window -t 5
    tmux bind-key -n M-6   select-window -t 6
    tmux bind-key -n M-7   select-window -t 7
    tmux bind-key -n M-8   select-window -t 8
    tmux bind-key -n M-9   select-window -t 9
    tmux bind-key -n M-0   select-window -t 10


    # <Alt+r> reload tmux config (source `~/.tmux.conf`)
    tmux bind-key -n M-r run-shell ' \
        tmux source-file ~/.tmux.conf > /dev/null; \
        tmux display-message "Sourced .tmux.conf!"'
    # <Alt+a r> reload tmux config (source `~/.tmux.conf`)
    tmux bind-key -n C-r run-shell ' \
        tmux source-file ~/.tmux.conf > /dev/null; \
        tmux display-message "Sourced .tmux.conf!"'


    # <prefix d> to detach
    mux bind-key d   detach-client

    # <Alt+q> list hotkeys
    tmux bind-key -n M-/   list-keys

    # command prompts
    # <prefix c> tmux cmd prompt
    tmux bind-key -n M-c   command-prompt -p "tmux:"
    # <prefix m> man cmd prompt
    tmux bind-key -n M-m   command-prompt -p "Man:" "split-window 'man %%'"

    # tmux vi copy mode bindings
    # <Home> - start of line
    tmux bind-key -t vi-copy Home  start-of-line
    # <End> - end of line
    tmux bind-key -t vi-copy End   end-of-line
    # <b> - toggle block selection mode
    tmux bind-key -t vi-copy b     rectangle-toggle

    ### SESSION HOTKEYS ###
    # <Alt+e> list sessions (session pane)
    tmux bind-key -n M-e   list-sessions

    ### WINDOW HOTKEYS ###
    # <Alt+t> new window
    tmux bind-key -n M-t   new-window
    # <prefix t> new window
    tmux bind-key t        new-window

    # Alt-` toggle last window
     tmux bind-key -n M-\`   last-window


    ## window splitting into panes (vi compatible)
    ## horizontally
    # <Alt+s> split horizontally
    tmux bind-key -n M-s   split-window -v
    # <prefix s> split horizontally
    tmux bind-key s        split-window -v
    ## vertically
    # <Alt+v> split vertically
    tmux bind-key -n M-v   split-window -h
    # <prefix v> split vertically
    tmux bind-key v        split-window -h

    # <ALt+w> close window
    tmux bind-key -r M-w   confirm-before kill-window

    ### PANE HOTKEYS ###
    # <Alt+Tab> toggle last pane
    tmux bind-key -n M-Tab last-pane

    ## pane selection (vi compatible)
    # <Alt+h/l/j/k> pane selection
    tmux bind-key -n M-h   select-pane -L
    tmux bind-key -n M-l   select-pane -R
    tmux bind-key -n M-j   select-pane -D
    tmux bind-key -n M-k   select-pane -U
    # <prefix h/l/j/k> pane selection
    tmux bind-key h        select-pane -L
    tmux bind-key l        select-pane -R
    tmux bind-key j        select-pane -D
    tmux bind-key k        select-pane -U

    ## pane resize (vi compatible)
    # <Alt+shift+h/l/j/k> pane resize
    tmux bind-key -n M-H resize-pane -L 5
    tmux bind-key -n M-L resize-pane -R 5
    tmux bind-key -n M-J resize-pane -D 5
    tmux bind-key -n M-K resize-pane -U 5
    # <prefix shift+h/l/j/k> pane resize
    tmux bind-key -r H   resize-pane -L 5
    tmux bind-key -r L   resize-pane -R 5
    tmux bind-key -r J   resize-pane -D 5
    tmux bind-key -r K   resize-pane -U 5

    ## swap panes
    # <Alt+d> swap pane backward
    tmux bind-key -n M-d   swap-pane -D
    # <Alt+shift+d> swap pane forward
    tmux bind-key -n M-D   swap-pane -U

    # <Alt+w> close pane
    tmux bind-key -n M-w   confirm-before kill-pane

}
main
