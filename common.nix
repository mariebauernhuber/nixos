# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports = [];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "UwUbox"; # Define your hostname.

  networking.networkmanager.enable = true;
  networking.wireless.enable = true;

  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "ja_JP.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ALL = "ja_JP.UTF-8";
  };

  fonts.packages = with pkgs; [
  noto-fonts-cjk-sans
         nerd-fonts.jetbrains-mono

  ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "IPAGothic" "DejaVu Sans Mono" ];
    sansSerif = [ "IPAPGothic" "DejaVu Sans" ];
    serif = [ "IPAPMincho" "DejaVu Serif" ];
  };

  i18n.inputMethod.enable = true;
  i18n.inputMethod.type = "fcitx5";
  i18n.inputMethod.fcitx5.addons = [pkgs.fcitx5-mozc];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nils = {
    isNormalUser = true;
    description = "Nils Ritter";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [neovim];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.displayManager.ly.enable = true;

  programs.hyprland.enable = true;

  hardware.opengl.enable = true;

  programs.firefox.enable = true;

  programs.git.enable = true;

  programs.nix-ld.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
  General = {
    Enable = "Source,Sink,Media,Socket";
  };
};


  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.blueman.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  kitty
  alacritty
  killall
  pavucontrol
  libnotify
  ];



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
