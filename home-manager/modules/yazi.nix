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

    programs.yazi = {
        enable = true;
    };
    home.file.".config/yazi/yazi.toml".source = ./yazi.cfg; 
    home.file.".config/yazi/keymap.toml".source = ./yazi-keymap.cfg; 

}

