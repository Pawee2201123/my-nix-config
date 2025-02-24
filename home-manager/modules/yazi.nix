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
}
