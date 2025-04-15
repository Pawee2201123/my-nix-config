{ config, lib, pkgs, ... }:

{
    programs.zathura = {
        enable = true;

        options = {
            selection-clipboard = "clipboard";
            #recolor = true;
        };

        mappings = {
            c = "set recolor";
        };
    };
}
