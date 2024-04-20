{ lib, stable, unstable, vscode-extensions, ... }:
{
  imports = [
    ./cursor.nix
    ./environment.nix
    ./neovim.nix
    ./packages.nix
    ./shell.nix
    ./tmux.nix
    ./vscodium.nix
    ./xdg.nix
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
