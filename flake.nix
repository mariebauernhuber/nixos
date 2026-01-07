{
	description = "My NixOS config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./common.nix
				./hosts/desktop/hardware-configuration.nix
				./modules/profiles/gaming.nix
				./modules/profiles/productivity.nix
				./modules/misc.nix
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.nils = import ./home.nix;
				}
				({ pkgs, ... }: {
				environment.systemPackages = [
				    pkgs.goxlr-utility
				    pkgs.helvum
				    pkgs.pavucontrol
				    pkgs.qjackctl
				];
				})
				{
				services.pipewire = {
					enable = true;
					audio.enable = true;
					pulse.enable = true;
					wireplumber.enable = true;
				};
				}
			];
		};

		nixosConfigurations.nixos-t470s = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./common.nix
				./hosts/t470s/hardware-configuration.nix
				./modules/profiles/productivity.nix
				./modules/misc.nix
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.nils = import ./home.nix;
				}
				({ pkgs, ... }: {
				environment.systemPackages = [
				pkgs.prismlauncher
				];
				})
				{
				services.auto-cpufreq.enable = true;
					services.auto-cpufreq.settings = {
					  battery = {
					     governor = "powersave";
					     turbo = "never";
					  };
					  charger = {
					     governor = "performance";
					     turbo = "auto";
					  };
					};
				services.fprintd.enable = true;
				  # If simply enabling fprintd is not enough, try enabling fprintd.tod...
				  services.fprintd.tod.enable = true;
				  # ...and use one of the next four drivers
				  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix; # Goodix driver module
				}
			];

		};
	};
}
