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
            brave
            syncthing
#yubi-key
            yubioath-flutter
            yubikey-manager
# user script
            (writeShellScriptBin "screenshot" (builtins.readFile ./script/screenshot.sh))
            (writeShellScriptBin "bm" (builtins.readFile ./script/web-bookmark-manager.sh))
            (writeShellScriptBin "signal-multi-instances" (builtins.readFile ./script/signal-multi-instances.sh))
#etc
            xdg-user-dirs
            texlive.combined.scheme-full
    ];
    };
    programs.home-manager.enable = true;
    #services
    services.network-manager-applet.enable = true;
    gtk = {
        enable = true;
        iconTheme = {
            package = pkgs.rose-pine-icon-theme;
            name = "rose-pine";        
        };
    };

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "text/html" = "librewolf.desktop";
            "x-scheme-handler/http" = "librewolf.desktop";
            "x-scheme-handler/https" = "librewolf.desktop";
            "x-scheme-handler/about" = "librewolf.desktop";
            "x-scheme-handler/unknown" = "librewolf.desktop";
            "application/pdf" = "org.pwmt.zathura.desktop";

        };
    };
}
