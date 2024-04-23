{ lib, stable, unstable, vscode-extensions, nix-colors, ... }:
{
  imports = [
    # Theming
    nix-colors.homeManagerModules.default
    ./theme.nix
    # Everything else
    ./cursor.nix
    ./environment.nix
    ./packages
    ./shell.nix
    ./xdg
  ];

  # Home Manager info
  home = {
    username = "jtdubs";
    homeDirectory = "/home/jtdubs";
  };

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Generate an HTML manual
  manual.html.enable = true;

  home.stateVersion = "23.11";
}
