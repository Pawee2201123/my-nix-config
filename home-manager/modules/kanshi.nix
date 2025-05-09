{ config, lib, pkgs, ... }:
{
    services.kanshi = {
        enable = true;
        extraConfig = ''

            profile  {
                output eDP-1 enable
                output DP-4 enable
            }
            profile  {
                output eDP-1 enable
                output HDMI-A-2 enable
            }

        '';
    };
}
