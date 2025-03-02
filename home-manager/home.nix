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
            firefox
            librewolf
            signal-desktop
            zathura
            xfce.thunar
        ];
    };
    programs.home-manager.enable = true;


                      }
