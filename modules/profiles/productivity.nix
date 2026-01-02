{ config, pkgs, lib, ... }:

{
    # Productivity packages
    environment.systemPackages = with pkgs; [
      neovim
      unzip # DEP for neovim (stylua)
      texliveFull
      zathura  # PDF viewer
    ];

    # Home Manager productivity configs
    home-manager.users.nils = {
      # Neovim config
      home.file.".config/nvim".source = ../../dots/nvim;
    };
}

