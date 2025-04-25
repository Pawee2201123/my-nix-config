{ config, lib, pkgs, ... }:

{
    home = {
        packages = with pkgs; [
            gcc
            ripgrep
            unzip
        ];
    };

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };

}
