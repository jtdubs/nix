{
  description = "nix-configurations";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
      stable = import inputs.nixpkgs-stable { inherit system config; };
      unstable = import inputs.nixpkgs-unstable { inherit system config; };
      vscode-extensions = inputs.nix-vscode-extensions.extensions.${system};
      nixos-hardware = inputs.nixos-hardware;
      disko = inputs.disko;
      nix-colors = inputs.nix-colors;
    in
    {
      nixosConfigurations = {
        pebble = inputs.nixpkgs-stable.lib.nixosSystem {
          pkgs = stable;
          specialArgs = { inherit disko nixos-hardware stable unstable; };
          inherit system;
          modules = [ ./hosts/pebble ];
        };
      };
      homeConfigurations = {
        "jtdubs@pebble" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = stable;
          extraSpecialArgs = { inherit stable unstable vscode-extensions nix-colors; };
          modules = [ ./users/jtdubs ];
        };
      };
    };
}
