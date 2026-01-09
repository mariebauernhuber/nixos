{ config, pkgs, lib, ... }:

{
    # Productivity packages
    environment.systemPackages = with pkgs; [
	neovim
	tree-sitter
	clang-tools
	python315
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

    # Home Manager productivity configs
    home-manager.users.nils = {
      # Neovim config
      home.file.".config/nvim".source = ../../dots/nvim;
    };
}

