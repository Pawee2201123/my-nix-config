{
	description = "My system config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
        disko = {
            url = "github:nix-community/disko";
			inputs.nixpkgs.follows = "nixpkgs";
        };
		xremap-flake.url = "github:xremap/nix-flake";
	};

	outputs = { nixpkgs, home-manager, disko, ... }@inputs: 
		let
			system = "x86_64-linux";
		in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			inherit system;
			modules = [ 
                ./nixos/configuration.nix 
                inputs.disko.nixosModules.disko
            ];
		};
		homeConfigurations.sisyphus = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [./home-manager/home.nix];
		};
	};
}
