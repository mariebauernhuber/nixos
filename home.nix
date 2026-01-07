{ config, pkgs, ... }:

{
	home.username = "nils";
	home.homeDirectory = "/home/nils";
	home.stateVersion = "24.11";

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use nixos btw";
			gacm = "git add -A && git commit -m";
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

	home.file = {
		".local/share/wallpaper/wallpaper.png".source = ./wallpaper.png;
		".config/hypr".source = ./dots/hypr;
		".config/waybar".source = ./dots/waybar;
		".config/alacritty".source = ./dots/alacritty;
	};

	services.hyprpaper = {
	  enable = true;
	  settings = {
	    preload = ["~/.local/share/wallpaper/wallpaper.png"];
	    wallpaper = [", ~/.local/share/wallpaper/wallpaper.png"];  # Replace DP-1 with your monitor
	  };
	};
}
