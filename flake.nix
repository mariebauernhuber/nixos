{
	description = "My NixOS config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, pkgs, home-manager, ... }@inputs: {
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
				environment.systemPackages = [
				    nixpkgs.goxlr-utility
				];

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
				{
				services.tlp = {
				      enable = true;
					      settings = {
						CPU_SCALING_GOVERNOR_ON_AC = "performance";
						CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

						CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
						CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

						CPU_MIN_PERF_ON_AC = 0;
						CPU_MAX_PERF_ON_AC = 100;
						CPU_MIN_PERF_ON_BAT = 0;
						CPU_MAX_PERF_ON_BAT = 50;
					      };
					};
				}
			];

		};
	};
}
