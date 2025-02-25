{ config, lib, pkgs, ... }:

let
zshHistory = "${config.xdg.cacheHome}/zsh/history";
in
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        history.size = 1000;
        history.path = zshHistory;

    };
    home.file.".zshrc".source = ./zsh.cfg; 

}
