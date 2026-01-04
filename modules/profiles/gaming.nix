{ config, pkgs, lib, ... }:

{
    # Gaming packages
    environment.systemPackages = with pkgs; [
      steam
      lutris
      bottles
      prismlauncher  # Minecraft
      gamescope
    ];

    # Enable Steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    # Wine for Windows games
    programs.wine.enable = true;

    # Home Manager gaming configs
    home-manager.users.nils = {
      home.packages = with pkgs; [
        vesktop
        obs-studio
      ];
  };
}

