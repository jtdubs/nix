{
  description = "nix-configurations";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs = inputs@{ self, ... }:
  let
    system = "x86_64-linux";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    stable = import inputs.nixpkgs-stable { inherit system config; };
    unstable = import inputs.nixpkgs-unstable { inherit system config; };
    nixos-hardware = inputs.nixos-hardware;
  in {
    nixosConfigurations = {
      decl = inputs.nixpkgs-stable.lib.nixosSystem {
        specialArgs = { inherit nixos-hardware stable unstable; };
        inherit system;
        modules = [
          ./hosts/decl/configuration.nix
          inputs.home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jtdubs = import ./users/jtdubs/home.nix;
            home-manager.extraSpecialArgs = { inherit stable unstable; };
          }
        ];
      };
    };
  };
}
