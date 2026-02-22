{ config, pkgs, lib, ... }:

{
    # Gaming packages
    environment.systemPackages = with pkgs; [
      steam
      lutris
      bottles
      prismlauncher  # Minecraft
      gamescope
      osu-lazer-bin
      olympus
    ];

    # Enable Steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    # Home Manager gaming configs
    home-manager.users.nils = {
      home.packages = with pkgs; [
	 (pkgs.wrapOBS {
	    plugins = with pkgs.obs-studio-plugins; [
	      input-overlay
	    ];
	  })
      ];
  };
}

