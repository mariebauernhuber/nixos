{ config, pkgs, lib, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    # When using a different channel you can use `ref = "nixos-<version>"` to set it here
  });
in{
    # Productivity packages
    environment.systemPackages = with pkgs; [
	unzip # DEP for neovim (stylua)
	texliveFull
	texlab
	zathura  # PDF viewer
	gcc
	gnumake
	pkg-config
	sdl3
	sdl3-ttf
	glew
	glm
    ];

	programs.nixvim = {
		enable = true;
		colorschemes.catppuccin.enable = true;
		plugins.lualine.enable = true;
	};
}
