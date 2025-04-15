{ config, lib, pkgs, ... }:

{
    home = {
        packages = with pkgs; [
            ffmpeg
            p7zip
            jq
            poppler
            fd
            ripgrep
            fzf
            zoxide
            imagemagick
            wl-clipboard
        ];
    };

    home.file.".config/yazi/yazi.toml".source = ./yazi.toml; 
    home.file.".config/yazi/keymap.toml".source = ./keymap.toml; 

}

