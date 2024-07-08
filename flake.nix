{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ...}@inputs:
  let 
    laptop = "msi-modern15-A5M";
  in
  {
    nixosConfigurations."${laptop}" = nixpkgs.lib.nixosSystem { 
      system = "x86_64-linux";
      modules = [ ./msi-modern15-A5M/configuration.nix ];
    };
  };
}
