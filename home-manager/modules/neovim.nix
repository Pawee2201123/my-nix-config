{ config, lib, pkgs, ... }:

{
    home = {
        packages = with pkgs; [
            libgcc
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
