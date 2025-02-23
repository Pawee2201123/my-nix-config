{ config, pkgs, ... }:

{
    home.file.".config/waybar/config".source = ./waybar.cfg; 
    home.file.".config/waybar/style.css".source = ./waybar_style.css; 
}

