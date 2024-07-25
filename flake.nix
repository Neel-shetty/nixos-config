{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    hostname = "nixos";
    username = "neel";
  in
  {

	nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
		specialArgs = {inherit inputs;};
		modules = [
			./configuration.nix
			inputs.home-manager.nixosModules.home-manager
			{
         		   	home-manager.useGlobalPkgs = true;
            		   	home-manager.useUserPackages = true;
            			home-manager.users.${username}= import ./home.nix;
				home-manager.extraSpecialArgs = {inherit inputs;};
          		}
		];
	};

  };
}
