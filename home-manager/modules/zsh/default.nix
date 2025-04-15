{ config, lib, pkgs, ... }:

{
    home.file.".zshenv".source = ./zshenv; 
    home.file.".zprofile".source = ./zprofile; 
    home.file.".zshrc".source = ./zshrc; 

}
