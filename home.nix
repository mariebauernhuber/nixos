{ config, pkgs, ... }:

{
	home.username = "nils";
	home.homeDirectory = "/home/nils";
	home.stateVersion = "24.11";

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use nixos btw";
		};
	};

	programs.wofi.enable = true;

	programs.gh.enable = true;

	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	programs.waybar.enable = true;

	programs.htop.enable = true;

	home.packages = with pkgs; [
		nordzy-cursor-theme
		nordzy-icon-theme
	];

	home.pointerCursor = {
	    enable = true;
	    gtk.enable = true;
	    x11.enable = true;  # For XWayland apps
	    name = "Nordzy-cursors";  # Or "Nordzy-cursors-white"
	    size = 24;
	    package = pkgs.nordzy-cursor-theme;
	};


	home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/dots/hypr;
	home.file.".config/waybar".source = ./dots/waybar;
}
