{
  description = "nix-configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  {
    nixosConfigurations = {
      decl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/decl/configuration.nix
        ];
      };
    };
  };
}
