{ config, pkgs, ... }:

{
    home = {
        packages = with pkgs; [
            waybar
            networkmanager
            grim
            slurp
            wl-clipboard
            #mako
            libnotify
            wev
        ];
    };


    services.network-manager-applet.enable=true;
    #services.mako.enable=true;


    home.file.".config/sway/config".source = ./config/sway/config;
    home.file.".config/sway/wpp.png".source = ./config/sway/wpp.png; 
}

