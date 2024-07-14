{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:Oungseik/nixvim";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let laptop = "msi-modern15-A5M";
    in {
      nixosConfigurations."${laptop}" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
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

      nixosConfigurations = {
        "virtualbox" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/virtualbox/configuration.nix ];
        };

        "asus-series-A56C" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/asus-series-A56C/configuration.nix ];
        };

      }; 

      homeConfigurations = {
        astro = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/astro.nix ];
        };

        oung = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/oung.nix ];
        };
      };
    };
}
