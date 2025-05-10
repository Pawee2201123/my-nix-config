
{ config, pkgs, inputs ,... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
            #inputs.xremap-flake.nixosModules.default
            ./disko.nix
        ];

# Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

        nix.settings.experimental-features = ["nix-command" "flakes"];



# Enable networking
    networking.networkmanager.enable = true;

# Set your time zone.
    time.timeZone = "Asia/Tokyo";
#time.timeZone = "Asia/Bangkok";

# Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "ja_JP.UTF-8";
        LC_IDENTIFICATION = "ja_JP.UTF-8";
        LC_MEASUREMENT = "ja_JP.UTF-8";
        LC_MONETARY = "ja_JP.UTF-8";
        LC_NAME = "ja_JP.UTF-8";
        LC_NUMERIC = "ja_JP.UTF-8";
        LC_PAPER = "ja_JP.UTF-8";
        LC_TELEPHONE = "ja_JP.UTF-8";
        LC_TIME = "ja_JP.UTF-8";
    };

    console={
        keyMap = "jp106";
    };
    services.gnome.gnome-keyring.enable = true;

    programs.sway ={
        enable = true;
        wrapperFeatures.gtk = true;
    };


#setup fcitx5
    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.waylandFrontend = true;
        fcitx5.addons = with pkgs; [
            fcitx5-mozc
                fcitx5-gtk
        ];
    };



    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;



# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.sisyphus = {
        isNormalUser = true;
        description = "sisyphus";
        extraGroups = [ "networkmanager" "wheel" "input"];
        packages = with pkgs; [];
    };
    security.sudo.wheelNeedsPassword = false;
# Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        neovim 
            home-manager
            wget
            git
            tree
            tmux
            keyd
            ciscoPacketTracer8 
    ];

#fonts
    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
            noto-fonts
            sarabun-font
            noto-fonts-cjk-sans
            jigmo
            ipaexfont
            kochi-substitute
    ];
# for xremap
/*
    services.xremap = {
        config = {
            modmap = [
            {
                name = "main remaps";
                remap = {
                /*
                    CapsLock = {
                        held = "leftctrl";
                        alone = "esc";
                    };
                    CapsLock = "esc";
                    Ctrl_L = "CapsLock";
                    Muhenkan = "rightctrl";
                    Henkan = "backspace";
                    leftshift = "rightshift";
                };
            }
            ];
        };
    };
    */
    services.keyd = {
        enable = true;
        keyboards = {
            default = {
                ids = [ "*" ]; 
                    settings = {
                        main = {
                            capslock = "overload(control, esc)"; 
                            esc = "capslock";
                            muhenkan = "leftmeta";
                            henkan = "backspace";
                        };
                        otherlayer = {};
                    };
                extraConfig = ''
                    '';
            };
        };
    };

    hardware.uinput.enable = true;
    users.groups.uinput.members = ["sisyphus"];
    users.groups.input.members = ["sisyphus"];
    #users.groups.keyd.members = ["sisyphus"];
#ssh
    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "yes";            # Allow root login
                PasswordAuthentication = true;      # Allow password login (or use key auth)
        };
    };
# Open ports in the firewall.
    networking.firewall.allowedTCPPorts = [ 53317 ];
    networking.firewall.allowedUDPPorts = [ 53317 ];

    system.stateVersion = "24.11"; # Did you read the comment?

#For thinkpad
        services.tlp.enable = true;
# Battery power management
    services.upower.enable = true;
# yubikey related
/*
    services.udev.packages = [ pkgs.yubikey-personalization ];
    services.pcscd.enable = true;
    #security.pam.services = {
    #    login.u2fAuth = true;
    #    sudo.u2fAuth = true;
    #};
    */
    #vpn
    services.mullvad-vpn.enable = true;
}


