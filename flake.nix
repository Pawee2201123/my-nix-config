{
	description = "My system config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		xremap-flake.url = "github:xremap/nix-flake";
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: 
		let
			system = "x86_64-linux";
		in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			inherit system;
			modules = [ ./nixos/configuration.nix ];
		};
		homeConfigurations.sisyphus = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [./home-manager/home.nix];
		};
	};
}
