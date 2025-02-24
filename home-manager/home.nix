{ config, pkgs, ...}: {
    imports = [
        ./modules
    ];
    home = {
        username = "sisyphus";
        homeDirectory = "/home/sisyphus";
        stateVersion = "24.11";

        packages = with pkgs; [
#TUI
            tmux
            fastfetch
            htop
            tree
            fzf
            yazi
            broot
#sway stuff
            wl-clipboard
            swayimg
            waybar
            wev
#app
            firefox
            librewolf
            signal-desktop
        ];
    };
    programs.home-manager.enable = true;


                      }
