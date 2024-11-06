{
	description = "Home Manager configuration of quelquun";

	inputs = {
		# Specify the source of Home Manager and Nixpkgs.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix.url = "github:danth/stylix";
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, stylix, nixvim, ...} @ inputs:
		let
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
			secrets = import ./secrets.nix;
		in {
			homeConfigurations."${secrets.username}" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;

				extraSpecialArgs = { inherit inputs; inherit secrets; };

				modules = [
					./home.nix
					stylix.homeManagerModules.stylix
					nixvim.homeManagerModules.nixvim
				];
			};
		};
}
