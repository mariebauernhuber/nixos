{ config, lib, pkgs, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	nix.settings.experimental-features = [ "nix-command" "flakes"];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "puppybox";

	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Berlin";

	services.pulseaudio.enable = true;

	programs.hyprland.enable = true;

	users.users.nille = {
		isNormalUser = true;
		extraGroups = [ "wheel" "input" ];
		packages = with pkgs; [
			tree
		];
	};

	environment.systemPackages = with pkgs; [
		git
		vim
		wget
		kitty
	];

	networking.firewall.enable = false;

	system.stateVersion = "26.05"; #DONT CHANGE UNLESS YOU KNOW WHAT YOURE DOING!
}
