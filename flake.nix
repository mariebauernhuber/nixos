{
  description = "Minimal NixOS flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.puppybox = nixpkgs.lib.nixosSystem {
      inherit system;
	extraSpecialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
	inputs.home-manager.nixosModules.default
      ];
    };
  };
}

