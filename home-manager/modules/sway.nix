{ config, pkgs, ... }:

{
    home = {

        packages = with pkgs; [
            waybar
            networkmanager
            grim
            slurp
            wl-clipboard
            mako
            wev
        ];
    };
    services.mako.enable = true;



    home.file.".config/sway/config".source = ./config/sway/config;
    home.file.".config/sway/wpp.png".source = ./config/sway/wpp.png; 
}

