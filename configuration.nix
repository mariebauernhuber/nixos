{ config, lib, pkgs, ... }:
{
	imports = [ ./hardware-configuration.nix ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "puppybox";

	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Berlin";

	services.pulseaudio.enable = true;

	programs.hyprland.enable = true;

	users.users.nille = {
		isNormalUser = true;
		extraGroups = [ "wheel" "input" ]; # Enable ‘sudo’ for the user.
		packages = with pkgs; [
			tree
		];
	};

	environment.systemPackages = with pkgs; [
		git
		neovim
		wget
		kitty
	];

	networking.firewall.enable = false;

	system.stateVersion = "26.05"; #DONT CHANGE UNLESS YOU KNOW WHAT YOURE DOING
}
