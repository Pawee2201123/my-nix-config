{ config, lib, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		extraConfig = ''
			set number relativenumber
			set tabstop=4       " Number of spaces a <Tab> counts for
			set shiftwidth=4    " Number of spaces to use for each level of indentation
			set expandtab       " Use spaces instead of tabs
			set softtabstop=4   " Number of spaces that <Tab> feels like in insert mode

			'';
	};

}
