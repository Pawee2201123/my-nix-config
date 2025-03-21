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
            ghostty tmux fastfetch
            htop
            tree
            fzf
            yazi
            broot
            ripdrag
            xdragon
            yt-dlp
            mpv
            android-tools
            universal-android-debloater
            jmtpfs
            rsync
#GUI app
            keepassxc
            librewolf
            signal-desktop
            zathura
            xournalpp
            anki
            vesktop
            thunderbird
            xfce.thunar
            localsend
# user script
            (writeShellScriptBin "screenshot" (builtins.readFile ./script/screenshot.sh))
            (writeShellScriptBin "signal-multi-instances" (builtins.readFile ./script/signal-multi-instances.sh))
#etc
            xdg-user-dirs
        ];
    };
    programs.home-manager.enable = true;


                      }
