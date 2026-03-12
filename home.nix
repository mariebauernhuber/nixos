{ config, pkgs, ... }:

{
	home.username = "nille";
	home.homeDirectory = "/home/nille";

	home.stateVersion = "25.11"; # DONT CHANGE

	nixpkgs.config.allowUnfree = true;

	home.packages = [
		pkgs.firefox
		pkgs.neovim
		pkgs.gh
		pkgs.wofi
		pkgs.goxlr-utility
		pkgs.pavucontrol
		pkgs.streamcontroller
		pkgs.kdePackages.dolphin
		pkgs.steam
	];

	home.sessionVariables = {
	};

	xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/dots/hypr";
	xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/dots/nvim";

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
