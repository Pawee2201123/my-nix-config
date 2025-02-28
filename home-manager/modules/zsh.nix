{ config, lib, pkgs, ... }:

{
    home.file.".zshenv".source = ./config/zsh/zshenv; 
    home.file.".zprofile".source = ./config/zsh/zprofile; 
    home.file.".zshrc".source = ./config/zsh/zshrc; 

}
