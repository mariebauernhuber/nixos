{ config, pkgs, lib, ... }:

{
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
