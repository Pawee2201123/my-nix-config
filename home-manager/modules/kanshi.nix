{ config, lib, pkgs, ... }:
{
    services.kanshi = {
        enable = true;
        extraConfig = ''
            output "Dell Inc. DELL S2721DS B8DDQ43" {
                    alias $HOME
            }
            output "BOE 0x074F Unknown" {
                    alias $INTERNAL
            }

            profile home {
                output $INTERNAL disable
                output $HOME enable
            }
            '';
    };
}
