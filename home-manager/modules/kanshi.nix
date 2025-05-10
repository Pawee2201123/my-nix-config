{ config, lib, pkgs, ... }:
{
    services.kanshi = {
        enable = true;
        extraConfig = ''
            output eDP-1 {
                mode 1920x1080@60
                position 0,0
                alias $internal
            }

            output DP-3 {
                mode 2560x1440@74.971
                position 1920,0
                alias $home
            }

            output HDMI-A-2 {
                position 1920,0
                alias $etc
            }

            profile home {
                output $internal disable
                output $home enable
            }

            profile outside {
                output $internal enable
                output $etc enable
            }

            '';
    };
}
