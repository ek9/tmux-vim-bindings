#!/usr/bin/env bash
# based on https://github.com/tmux-plugins/tmux-sensible

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# used to match output from `tmux list-keys`
KEY_BINDING_REGEX="bind-key[[:space:]]\+\(-r[[:space:]]\+\)\?\(-T prefix[[:space:]]\+\)\?"

command_exists() {
    local command="$1"
    type "$command" >/dev/null 2>&1
}

# returns prefix key, e.g. 'C-a'
prefix() {
    tmux show-option -gv prefix
}

# if prefix is 'C-a', this function returns 'a'
prefix_without_ctrl() {
    local prefix="$(prefix)"
    echo "$prefix" | cut -d '-' -f2
}

option_value_not_changed() {
    local option="$1"
    local default_value="$2"
    local option_value=$(tmux show-option -gv "$option")
    [ "$option_value" == "$default_value" ]
}

server_option_value_not_changed() {
    local option="$1"
    local default_value="$2"
    local option_value=$(tmux show-option -sv "$option")
    [ "$option_value" == "$default_value" ]
}

key_binding_not_set() {
    local key="$1"
    if $(tmux list-keys | grep -q "${KEY_BINDING_REGEX}${key}[[:space:]]"); then
        return 1
    else
        return 0
    fi
}

key_binding_not_changed() {
    local key="$1"
    local default_value="$2"
    if $(tmux list-keys | grep -q "${KEY_BINDING_REGEX}${key}[[:space:]]\+${default_value}"); then
        # key still has the default binding
        return 0
    else
        return 1
    fi
}

main() {

    # KEY BINDING OPTIMIZATIONS (based on tmux-sensible)

    # address vim mode switching delay (http://superuser.com/a/252717/65504)
    #if server_option_value_not_changed "escape-time" "500"; then
    tmux set-option -s escape-time 0
    #fi

    ### GENERIC HOTKEYS ###

    # <Alt+A> prefix (unbind Ctrl+b)
    tmux unbind C-b
    tmux set-option -g   prefix M-a
    tmux bind-key M-a    send-prefix
    tmux bind-key -n C-a send-prefix

    # <prefix d> to detach
    tmux unbind-key d      ; tmux bind-key d   detach-client

    # <Alt+q> list hotkeys
    tmux unbind-key M-q      ; tmux bind-key -n M-q   list-keys

    # command prompts
    # <prefix c> tmux cmd prompt
    tmux unbind-key M-c      ; tmux bind-key -n M-c   command-prompt -p "tmux:"
    # <prefix m> man cmd prompt
    tmux unbind-key M-m      ; tmux bind-key -n M-m   command-prompt -p "Man:" "split-window 'man %%'"

    # tmux vi copy mode bindings
    # <Home> - start of line
    tmux unbind-key -t vi-copy Home  ; tmux bind-key -t vi-copy Home  start-of-line
    # <End> - end of line
    tmux unbind-key -t vi-copy End   ; tmux bind-key -t vi-copy End   end-of-line
    # <b> - toggle block selection mode
    tmux unbind-key -t vi-copy b     ; tmux bind-key -t vi-copy b     rectangle-toggle

    ### SESSION HOTKEYS ###
    # <Alt+e> list sessions (session pane)
    tmux unbind-key M-e      ; tmux bind-key -n M-e   list-sessions

    ### WINDOW HOTKEYS ###
    # <Alt+t> new window
    tmux unbind-key M-t      ; tmux bind-key -n M-t   new-window
    # <prefix t> new window
    tmux unbind-key t        ; tmux bind-key t        new-window

    # Alt-` toggle last window
    tmux unbind-key M-\`      ; tmux bind-key -n M-\`   last-window


    ## Select Window
    # <prefix Num> select window #num
    tmux unbind-key 1        ; tmux bind-key 1        select-window -t 1
    tmux unbind-key 2        ; tmux bind-key 2        select-window -t 2
    tmux unbind-key 3        ; tmux bind-key 3        select-window -t 3
    tmux unbind-key 4        ; tmux bind-key 4        select-window -t 4
    tmux unbind-key 5        ; tmux bind-key 5        select-window -t 5
    tmux unbind-key 6        ; tmux bind-key 6        select-window -t 6
    tmux unbind-key 7        ; tmux bind-key 7        select-window -t 7
    tmux unbind-key 8        ; tmux bind-key 8        select-window -t 8
    tmux unbind-key 9        ; tmux bind-key 9        select-window -t 9
    tmux unbind-key 0        ; tmux bind-key 0        select-window -t 10
    # <Alt+Num> select window #num
    tmux unbind-key M-1      ; tmux bind-key -n M-1   select-window -t 1
    tmux unbind-key M-2      ; tmux bind-key -n M-2   select-window -t 2
    tmux unbind-key M-3      ; tmux bind-key -n M-3   select-window -t 3
    tmux unbind-key M-4      ; tmux bind-key -n M-4   select-window -t 4
    tmux unbind-key M-5      ; tmux bind-key -n M-5   select-window -t 5
    tmux unbind-key M-6      ; tmux bind-key -n M-6   select-window -t 6
    tmux unbind-key M-7      ; tmux bind-key -n M-7   select-window -t 7
    tmux unbind-key M-8      ; tmux bind-key -n M-8   select-window -t 8
    tmux unbind-key M-9      ; tmux bind-key -n M-9   select-window -t 9
    tmux unbind-key M-0      ; tmux bind-key -n M-0   select-window -t 10

    ## window splitting into panes (vi compatible)
    ## horizontally
    # <Alt+s> split horizontally
    tmux unbind-key M-s      ; tmux bind-key -n M-s   split-window -v
    # <prefix s> split horizontally
    tmux unbind-key s        ; tmux bind-key s        split-window -v
    ## vertically
    # <Alt+v> split vertically
    tmux unbind-key M-v      ; tmux bind-key -n M-v   split-window -h
    # <prefix v> split vertically
    tmux unbind-key v        ; tmux bind-key v        split-window -h

    # <ALt+w> close window
    tmux unbind-key M-w      ; tmux bind-key -r M-w   confirm-before kill-window

    ### PANE HOTKEYS ###
    # <Alt+Tab> toggle last pane
    tmux unbind-key M-Tab    ; tmux bind-key -n M-Tab last-pane

    ## pane selection (vi compatible)
    # <Alt+h/l/j/k> pane selection
    tmux unbind-key M-h      ; tmux bind-key -n M-h   select-pane -L
    tmux unbind-key M-l      ; tmux bind-key -n M-l   select-pane -R
    tmux unbind-key M-j      ; tmux bind-key -n M-j   select-pane -D
    tmux unbind-key M-k      ; tmux bind-key -n M-k   select-pane -U
    # <prefix h/l/j/k> pane selection
    tmux unbind-key h        ; tmux bind-key h        select-pane -L
    tmux unbind-key l        ; tmux bind-key l        select-pane -R
    tmux unbind-key j        ; tmux bind-key j        select-pane -D
    tmux unbind-key k        ; tmux bind-key k        select-pane -U

    ## pane resize (vi compatible)
    # <Alt+shift+h/l/j/k> pane resize
    tmux unbind-key M-H    ; tmux bind-key -n M-H resize-pane -L 5
    tmux unbind-key M-L    ; tmux bind-key -n M-L resize-pane -R 5
    tmux unbind-key M-J    ; tmux bind-key -n M-J resize-pane -D 5
    tmux unbind-key M-K    ; tmux bind-key -n M-K resize-pane -U 5
    # <prefix shift+h/l/j/k> pane resize
    tmux unbind-key H      ; tmux bind-key -r H   resize-pane -L 5
    tmux unbind-key L      ; tmux bind-key -r L   resize-pane -R 5
    tmux unbind-key J      ; tmux bind-key -r J   resize-pane -D 5
    tmux unbind-key K      ; tmux bind-key -r K   resize-pane -U 5

    ## swap panes
    # <Alt+d> swap pane backward
    tmux unbind-key M-d      ; tmux bind-key -n M-d   swap-pane -D
    # <Alt+shift+d> swap pane forward
    tmux unbind-key M-D      ; tmux bind-key -n M-D   swap-pane -U

    # <Alt+w> close pane
    tmux unbind-key M-w      ; tmux bind-key -n M-w   confirm-before kill-pane

    # KEY BINDING OPTIMIZATIONS (based on tmux-sensible)
    local prefix="$(prefix)"
    local prefix_without_ctrl="$(prefix_without_ctrl)"

    # unbind `C-b` if it is not used as a prefix
    if [ $prefix != "C-b" ]; then
        # unbind obsolte default binding
        if key_binding_not_changed "C-b" "send-prefix"; then
            tmux unbind-key C-b
        fi

        # pressing `prefix + prefix` sends <prefix> to the shell
        if key_binding_not_set "$prefix"; then
            tmux bind-key "$prefix" send-prefix
        fi
    fi

    # `M-a r`   - reload tmux config (source `~/.tmux.conf`)
    if key_binding_not_set "R"; then
        tmux bind-key R run-shell ' \
            tmux source-file ~/.tmux.conf > /dev/null; \
            tmux display-message "Sourced .tmux.conf!"'
    fi

    # fix issues with Shift+PgUp/PgDn scrolling
    tmux set-option -g   terminal-overrides 'xterm*:smcup@:rmcup@'

}
main
