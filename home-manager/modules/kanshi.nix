{ config, lib, pkgs, ... }:
{
    services.kanshi = {
        enable = true;
        settings = ''

            profile mirror {
                output eDP-1 {
                    mode 1920x1080
                        position 0,0
                }

                output HDMI-A-2 {
                    mode 1920x1080
                        position 0,0
                }
            }
        '';
    };
}
