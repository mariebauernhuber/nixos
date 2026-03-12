{ config, lib, pkgs, inputs, ... }:

{
	imports = [
		./hardware-configuration.nix 
		inputs.home-manager.nixosModules.default
	];

	nix.settings.experimental-features = [ "nix-command" "flakes"];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "puppybox";

	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Berlin";

	programs.hyprland.enable = true;

	services.displayManager.ly.enable = true;

	users.users.nille = {
		isNormalUser = true;
		extraGroups = [ "wheel" "input" ];
		packages = with pkgs; [
			nordzy-cursor-theme
			nordzy-icon-theme
		];
	};

	home-manager = {
		extraSpecialArgs = {inherit inputs;};
		users = {
			"nille" = import ./home.nix;
		};
	};

	environment.systemPackages = with pkgs; [
		git
		wget
		kitty
	];

	networking.firewall.enable = false;

	system.stateVersion = "26.05"; #DONT CHANGE UNLESS YOU KNOW WHAT YOURE DOING!
}
