{ config, pkgs, lib, ... }:

{
    # Productivity packages
    environment.systemPackages = with pkgs; [
    qpwgraph
    fastfetch
    hyfetch
    nwg-displays
    ulauncher
     (nwg-displays.overrideAttrs (old: {
    postInstall = ''
      wrapProgram $out/bin/nwg-displays \
        --set XDG_CONFIG_HOME "/tmp/nwg-displays"
    '';
  }))
    ];

    programs.kdeconnect.enable = true;

    home-manager.users.nils = {

    };

    services.flatpak.enable = true;
}

