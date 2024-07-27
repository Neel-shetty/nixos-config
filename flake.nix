{
  description = "Neels nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    catppuccin.url = "github:catppuccin/nix";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      hostname = "nixos";
      username = "neel";
    in {

      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          inputs.catppuccin.nixosModules.catppuccin
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = {
              imports = [
                ./home.nix
                inputs.catppuccin.homeManagerModules.catppuccin
                inputs.nix-index-database.hmModules.nix-index
              ];
            };
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
      # homeConfigurations.${username} =
      #   inputs.home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;

      #     modules = [
      #       inputs.nix-index-database.hmModules.nix-index
      #       # optional to also wrap and install comma
      #       { programs.nix-index-database.comma.enable = true; }
      #     ];
      #   };

    };
}
