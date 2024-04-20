{ lib, stable, unstable, vscode-extensions, nix-colors, ... }:
{
  colorScheme = nix-colors.colorSchemes.nord;

  imports = [
    nix-colors.homeManagerModules.default
    ./alacritty.nix
    ./cursor.nix
    ./environment.nix
    ./neovim.nix
    ./packages.nix
    ./shell.nix
    ./sway.nix
    ./swaylock.nix
    ./tmux.nix
    ./vscodium.nix
    ./waybar.nix
    ./wob.nix
    ./xdg.nix
  ];

  # Theme usages
  # neovim    - colorscheme plugin
  # tmux      - tmux plugin
  # vscodium  - vscode plugin
  # btop      - built-in theme
  # mako      - rgb values in config file
  # tofi      - rgb values in config file

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
