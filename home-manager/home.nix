{ config, pkgs, ...}: {
    imports = [
        ./modules
    ];
    home = {
        username = "sisyphus";
        homeDirectory = "/home/sisyphus";
        stateVersion = "24.11";

        packages = with pkgs; [
            tmux
                wl-clipboard
                fastfetch
                htop
                tree
                fzf
                swayimg
                wev
                firefox
                librewolf
                signal-desktop
        ];
    };
    programs.home-manager.enable = true;


                      }
