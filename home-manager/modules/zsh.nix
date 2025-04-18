{ config, lib, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            nrs = "sudo nixos-rebuild switch --flake .";
            hms = "home-manager switch --flake .";
            ztr = "zathura";
            ff = "fastfetch";
            mh = "man home-configuration.nix";
            mc = "man configuration.nix";
        };
        history.size = 10000;
        plugins = [
        {
            name = "zsh-vi-mode";
            src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
        }
        {
            name = "fzf-tab";
            src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        }
        {
            name = "zsh-fzf-history-search";
            src = "${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search";
        }
        ];
        initExtra = ''
            zvm_after_init_commands+=(eval "$(fzf --zsh)")
            '';
        profileExtra = ''
            if [[ $(id -u) -ge 1000 && $(tty) == "/dev/tty1" && -z $(pgrep sway) ]]; then
                exec sway
                    fi
                    '';

    };
}
