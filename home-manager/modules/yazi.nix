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
                show_hidden = false;
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
            keymap = {
                manager.prepend_keymap = [
                {
                    on = "<C-n>";  # Ctrl + N
                    run = ''shell -- ripdrag -x -i -T "$1"'';
                    desc = "Drag-and-drop with Dragon";  # Description for the binding
                }
                ];
            };

        };
    };
}

