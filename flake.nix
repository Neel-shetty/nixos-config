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
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    # blender-bin.url = "github:edolstra/nix-warez?dir=blender";
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
                ./home/home.nix
                inputs.sops-nix.nixosModules.sops
                inputs.catppuccin.homeManagerModules.catppuccin
                inputs.nix-index-database.hmModules.nix-index
              ];
            };
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
          # ({ config, pkgs, ... }: {
          #   nixpkgs.overlays = [ inputs.blender-bin.overlays.default ];
          #   # This line can either be here or in configuration.nix
          #   environment.systemPackages = with pkgs; [ blender_4_1 ];
          # })
        ];
      };
      homeConfigurations.${username} =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            inputs.nix-index-database.hmModules.nix-index
            # optional to also wrap and install comma
            {
              programs.nix-index-database.comma.enable = true;
              # inputs.blender-bin.packages.x86_64-linux.blender_4_1.enable =
                # true;

            }
          ];
        };

    };
}
