{ config, lib, pkgs, ... }:

let
zshHistory = "${config.xdg.cacheHome}/zsh/history";
in
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        history.size = 1000;
        history.path = zshHistory;

        initExtra = ''
            autoload -U colors && colors
            PROMPT='[%F{red}%1d%f]$ '
            zstyle :compinstall filename "${config.xdg.configHome}/zsh/zshrc"
            zstyle ':completion::complete:*' gain-privileges 1
            autoload -Uz compinit
            zstyle ':completion:*' menu select
            zmodload zsh/complist
            compinit
            _comp_options+=(globdots) #hidden files

# vi mode
            bindkey -v
            export KEYTIMEOUT=1
            bindkey -M menuselect 'h' vi-backward-char
            bindkey -M menuselect 'k' vi-up-line-or-history
            bindkey -M menuselect 'l' vi-forward-char
            bindkey -M menuselect 'j' vi-down-line-or-history
            bindkey -v '^?' backward-delete-char
            bindkey '^R' history-incremental-search-backward

# aliases
            alias v='nvim'
            alias ls='ls --color=auto'
            alias grep='grep --color=auto'
            alias ff='fastfetch'
            alias sz='source ${config.xdg.configHome}/zsh/zshrc'
            alias ez='nvim ${config.xdg.configHome}/zsh/zshrc'
            alias eswc='nvim ${config.xdg.configHome}/sway/config'
            alias ef='nvim ${config.xdg.configHome}/foot/foot.ini'
            alias emacs="emacsclient -c -a 'emacs'"
            alias freq='cat ~/frequsecommand|fzf|wl-copy'
            alias aria2c='aria2c --disable-ipv6'
            alias fcd='cd $(find . -type d -print | fzf)'

            '';
    };
}
