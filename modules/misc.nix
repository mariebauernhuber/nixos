{ config, pkgs, lib, ... }:

{
    # Productivity packages
    environment.systemPackages = with pkgs; [
    nwg-displays
     (nwg-displays.overrideAttrs (old: {
    postInstall = ''
      wrapProgram $out/bin/nwg-displays \
        --set XDG_CONFIG_HOME "/tmp/nwg-displays"
    '';
  }))
    ];

    home-manager.users.nils = {

    };

    services.flatpak.enable = true;
}

