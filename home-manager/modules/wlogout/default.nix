{ config, pkgs, ... }:

{
    home.file.".config/wlogout/layout".source = ./layout;
}

