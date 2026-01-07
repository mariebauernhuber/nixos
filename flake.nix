{
	description = "My NixOS config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixos-06cb-009a-fingerprint-sensor = {
	      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
	      inputs.nixpkgs.follows = "nixpkgs";
	      };
	};

	outputs = { nixpkgs, home-manager, nixos-06cb-009a-fingerprint-sensor, ... }@inputs: {
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
		@attrs:
		  let
		    lib = nixpkgs.lib;
		  in {
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
									  services.fprintd = {
					    enable = true;
					    tod = {
					      enable = true;
					      driver = nixos-06cb-009a-fingerprint-sensor.lib.libfprint-2-tod1-vfs0090-bingch {
						calib-data-file = ./calib-data.bin;
					      };
					    };
					  };
					}
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
					}
				];

			};
		}
	};
}
