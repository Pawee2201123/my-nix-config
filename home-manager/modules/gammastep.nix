{ config, lib, pkgs, ... }:

{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 38.3;
    longitude = 140.8;
    #duskTime = "19:30-23:59";
    #dawnTime = "6:00-8:30";
    temperature = {
        day = 5500;
        night = 1000;
    };
  };
}
