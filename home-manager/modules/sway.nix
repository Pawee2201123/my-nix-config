{ config, pkgs, ... }:

{
    home = {
        packages = with pkgs; [
            wlogout
            waybar
            networkmanager
            grim
            slurp
            satty
            wl-clipboard
            mako
            libnotify
            wev
        ];
    };


    services.network-manager-applet.enable=true;
    services.mako = {
        enable = true;
        borderSize = 3;
        defaultTimeout = 5000; # 5s
        font = "Fira Sans 10";
        margin = "30";
        padding = "5";
    };


    home.file.".config/sway/config".source = ./config/sway/config;
    home.file.".config/sway/wpp.png".source = ./config/sway/wpp.png; 
}

