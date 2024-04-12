{
  description = "nix-configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, ... }:
  let
    pkgs = import nixpkgs { };
  in
  {
    nixosConfigurations = with pkgs; {
      decl = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-hardware.nixosModules.framework-13th-gen-intel
          ./hosts/decl/configuration.nix
          home-manager.nixosModules.home-manager
          {
            users.users.jtdubs = ./users/jtdubs/user.nix;
            home-manager.useUserPackages = true;
            home-manager.users.jtdubs = ./users/jtdubs/home.nix;
          }
        ];
        specialArgs = { inherit nixpkgs; };
      };
    };
  };
}
