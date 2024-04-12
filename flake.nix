{
  description = "nix-configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
  {
    nixosConfigurations = {
      decl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/decl/configuration.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
