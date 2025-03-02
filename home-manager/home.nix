{ config, pkgs, ...}: {
    imports = [
        ./modules
    ];
    home = {
        username = "sisyphus";
        homeDirectory = "/home/sisyphus";
        stateVersion = "24.11";

        packages = with pkgs; [
#CLI app
            kitty
            ghostty
            tmux fastfetch
            htop
            tree
            fzf
            yazi
            broot
            ripdrag
            xdragon

#GUI app
            keepassxc
            librewolf
            signal-desktop
            zathura
            anki
            vesktop
            xfce.thunar
        ];
    };
    programs.home-manager.enable = true;


                      }
