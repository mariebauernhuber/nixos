{ config, pkgs, lib, ... }:

{
    # Productivity packages
    environment.systemPackages = with pkgs; [
    nwg-displays
    ];

    home-manager.users.nils = {

    };

    services.flatpak.enable = true;
}

