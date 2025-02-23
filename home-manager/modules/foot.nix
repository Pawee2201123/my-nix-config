# ~/.config/nixpkgs/home.nix
{ config, pkgs, ... }:

{
	programs.foot = {
		enable = true;  # Enable foot terminal emulator
		settings = 	{
			main = {
				font = "JetBrainsMono Nerd Font:style=Regular:size=20,Noto Sans Mono CJK JP:style=Regular:size=20";
			};
			colors = {
				alpha=0.75;
				flash="7f7f00";
				flash-alpha=0.5;
				background="1a1b26";
				foreground="c0caf5";
				regular0="15161E";
				regular1="f7768e";
				regular2="9ece6a";
				regular3="e0af68";
				regular4="7aa2f7";
				regular5="bb9af7";
				regular6="7dcfff";
				regular7="a9b1d6";
				bright0="414868";
				bright1="f7768e";
				bright2="9ece6a";
				bright3="e0af68";
				bright4="7aa2f7";
				bright5="bb9af7";
				bright6="7dcfff";
				bright7="c0caf5";
			};
			scrollback = {
				lines = 100000;
			};
			mouse = {
				hide-when-typing = "yes";
			};
		};
	};
}

