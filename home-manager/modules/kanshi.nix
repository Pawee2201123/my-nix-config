{ config, lib, pkgs, ... }:
{
    services.kanshi = {
        enable = true;
        extraConfig = ''
            output "Dell Inc. DELL S2721DS B8DDQ43" {
                mode 1920x1080@60
                    position 1920,0
                    scale 1.0
                    alias $HOME
            }
            output "BOE 0x074F Unknown" {
                mode 1920x1080@60
                    position 0,0
                    scale 1.0
                    alias $INTERNAL
            }

            profile home {
                output $INTERNAL disable
                output $HOME enable
            }
            '';
    };
}
