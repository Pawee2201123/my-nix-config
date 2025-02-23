{ config, pkgs, ... }:

{
    #wayland.windowManager.sway = {
    #    enable = true;
    #    xwayland = true;
    #};
    home.file.".config/sway/config".source = ./sway.cfg; 
    home.file.".config/sway/wpp.png".source = ./wpp.png; 
}

