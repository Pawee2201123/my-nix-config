{ config, pkgs, ... }:

{

    home.file.".config/keyd/app.conf".source = ./app.conf;
}

