{ config, lib, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            nrs = "sudo nixos-rebuild switch --flake .";
            hms = "home-manager switch --flake .";
        };
        history.size = 10000;
        initExtra = ''
            zmodload zsh/complist
            zstyle ':completion:*' menu select
#vi mode
            bindkey -v
            export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
            bindkey -M menuselect 'h' vi-backward-char
            bindkey -M menuselect 'k' vi-up-line-or-history
            bindkey -M menuselect 'l' vi-forward-char
            bindkey -M menuselect 'j' vi-down-line-or-history
            bindkey -v '^?' backward-delete-char
            bindkey '^R' history-incremental-search-backward

        '';

    };
}
