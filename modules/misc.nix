{ config, pkgs, lib, ... }:

{
    # Productivity packages
    environment.systemPackages = with pkgs; [
    ];

    home-manager.users.nils = {

    };

    services.flatpak.enable = true;
}

