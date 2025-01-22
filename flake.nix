{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:Oungseik/nixvim-experimental";
    nix-colors.url = "github:misterio77/nix-colors";
    # helix.url = "github:helix-editor/helix/25.01.1";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        "msi-modern15-A5M" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/msi-modern15-A5M/configuration.nix
            # you can use this instead of `specialArgs`. Check out https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-flake-and-module-system#pass-non-default-parameters-to-submodules
            # { _module.args = { inherit inputs; }; }

            # # if you want to enable home manager as nixos module, enable this. but you need to disable the home configuration
            # # otherwise you will get recursion error
            # home-manager.nixosModules.home-manager {
            #   home-manager.useGlobalPkgs = true;
            #   home-manager.useUserPackages = true;
            #   home-manager.users.oung = import ./home/oung.nix;
            # }
          ];
        };

        "asus-series-A56C" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [ ./hosts/asus-series-A56C/configuration.nix ];
        };

      };

      homeConfigurations = {
        oung = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./home/oung.nix ];
        };

        saitama = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./home/saitama.nix ];
        };
      };
    };
}
