{ config, pkgs, ... }:

{
    home = {

        packages = with pkgs; [
            waybar
            networkmanager
            grim
            wl-clipboard
            mako
            wev
        ];
    };
    



    home.file.".config/sway/config".source = ./config/sway/config;
    home.file.".config/sway/wpp.png".source = ./config/sway/wpp.png; 
}

