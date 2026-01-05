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
  (nwg-displays.overrideAttrs (old: {
    postInstall = ''
      wrapProgram $out/bin/nwg-displays \
        --set-default XDG_CONFIG_HOME "$HOME/.cache/nwg-displays"
    '';
  }))
];


	home.file.".config/hypr".source = ./dots/hypr;
	home.file.".config/waybar".source = ./dots/waybar;
}
