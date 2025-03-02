{ config, lib, pkgs, ... }:

{
    programs.tmux = {
        enable = true;
        clock24 = true;
        extraConfig = '' 
# used for less common options, intelligently combines if defined in multiple places.
# Set the prefix key to Alt+f
            set-option -g prefix M-f
            unbind-key C-b
            bind-key M-f send-prefix
# esc key no delay
            set -sg escape-time 0
#enable mouse
            set -g mouse on

#config reload
#bind-key R source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded."

#show second on clock mode

# vi is good
            setw -g mode-keys vi

# Vertical split key binding
            bind-key '%' split-window -h -c "#{pane_current_path}"

# Horizontal split key binding
            bind-key '-' split-window -v -c "#{pane_current_path}"
            bind-key S new-session
#vim-like keys
            bind-key -n M-h select-pane -L
            bind-key -n M-j select-pane -D
            bind-key -n M-k select-pane -U
            bind-key -n M-l select-pane -R

# Alternate between windows with Alt+h and Alt+l without prefix
            bind-key  h select-window -t :-
            bind-key  l select-window -t :+
# Rename windows
            bind-key r command-prompt -I "#W" "rename-window '%%'"
            '';
    };
}

