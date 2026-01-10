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
				    pkgs.streamcontroller
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
				}
			];

		};
		 let
		    systems = [ "x86_64-linux" ];
		    forAllSystems = f: builtins.listToAttrs (map
		      (system: { name = system; value = f system; })
		      systems);
		  in {
		    devShells = forAllSystems (system:
		      let
			pkgs = import nixpkgs { inherit system; };
		      in {
			# keep an existing shell if you already had one
			# existing = ...;

			# add / override the C++ / SDL3 / clangd shell
			default = pkgs.mkShell {
			  packages = with pkgs; [
			    gcc
			    gnumake
			    pkg-config

			    sdl3
			    sdl3-ttf
			    glew
			    glm

			    clang-tools
			    bear
			  ];

			  shellHook = ''
			    echo "Dev shell: C++ / SDL3 / clangd"
			  '';
			};
		      });
		  };

	};
}
