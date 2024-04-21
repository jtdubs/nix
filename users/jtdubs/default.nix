{ lib, stable, unstable, vscode-extensions, nix-colors, ... }:
{
  colorScheme = nix-colors.colorSchemes.nord;

  imports = [
    nix-colors.homeManagerModules.default
    ./alacritty.nix
    ./cursor.nix
    ./environment.nix
    ./mako.nix
    ./neovim.nix
    ./packages.nix
    ./shell.nix
    ./sway.nix
    ./swaylock.nix
    ./tmux.nix
    ./tofi.nix
    ./vscodium.nix
    ./waybar.nix
    ./wob.nix
    ./xdg.nix
  ];

  # Theme usages
  # vscodium - vscode plugin
  # btop     - built-in theme

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
