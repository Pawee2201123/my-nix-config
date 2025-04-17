{ config, lib, pkgs, ... }:

{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 38.3;
    longitude = 180.8;
    duskTime = "19:30-23:59";
    temperature = {
        day = 5500;
        night = 1000;
    };
  };
}
