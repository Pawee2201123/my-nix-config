{ config, pkgs, ... }:

{
    home.file.".config/wlogout/layout".source = ./config/wlogout/layout;
}

