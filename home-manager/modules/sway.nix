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
    }
    

#setup fcitx5
    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.addons = with pkgs; [
            fcitx5-mozc
            fcitx5-gtk
        ];
    };


    home.file.".config/sway/config".source = ./config/sway/config;
    home.file.".config/sway/wpp.png".source = ./config/sway/wpp.png; 
}

