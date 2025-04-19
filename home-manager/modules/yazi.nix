{ config, lib, pkgs, ... }:

{
    programs.yazi = {
        enable = true;
        enableZshIntegration = true;
        shellWrapperName = "y";
        settings = {
            manager = {
                ratio = [
                    1
                        4
                        3
                ];
                sort_by = "natural";
                sort_sensitive = true;
                sort_reverse = false;
                sort_dir_first = true;
                linemode = "none";
                show_hidden = true;
                show_symlink = true;
            };

            preview = {
                image_filter = "lanczos3";
                image_quality = 90;
                tab_size = 1;
                max_width = 600;
                max_height = 900;
                cache_dir = "";
                ueberzug_scale = 1;
                ueberzug_offset = [
                    0
                        0
                        0
                        0
                ];
            };
            tasks = {
                micro_workers = 5;
                macro_workers = 10;
                bizarre_retry = 5;
            };
        };
        keymap = {
            manager.prepend_keymap = [
            { run = "escape"; on = [ "<Esc>" ]; }
            { run = "quit"; on = [ "q" ]; }
            { run = "close"; on = [ "<C-q>" ]; }
            { run = "shell -- ripdrag \"$@\""; on = ["<C-n>"];}
            { run = "plugin relative-motions"; on = [ "m" ];   desc = "Trigger a new relative motion";}
            { run = "plugin relative-motions 1"; on = [ "1" ]; desc = "Move in relative steps";}
            { run = "plugin relative-motions 2"; on = [ "2" ]; desc = "Move in relative steps";}
            { run = "plugin relative-motions 3"; on = [ "3" ]; desc = "Move in relative steps";}
            { run = "plugin relative-motions 4"; on = [ "4" ]; desc = "Move in relative steps";}
            { run = "plugin relative-motions 5"; on = [ "5" ]; desc = "Move in relative steps";}
            { run = "plugin relative-motions 6"; on = [ "6" ]; desc = "Move in relative steps";}
            { run = "plugin relative-motions 7"; on = [ "7" ]; desc = "Move in relative steps";}
            { run = "plugin relative-motions 8"; on = [ "8" ]; desc = "Move in relative steps";}
            { run = "plugin relative-motions 9"; on = [ "9" ]; desc = "Move in relative steps";}
            ];

        };
    };
}
