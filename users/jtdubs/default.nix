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
    ./tmux.nix
    ./vscodium.nix
    ./xdg.nix
  ];

  # Theme usages
  # neovim    - colorscheme plugin
  # tmux      - tmux plugin
  # vscodium  - vscode plugin
  # btop      - built-in theme
  # alacritty - rgb values in config file
  # mako      - rgb values in config file
  # sway      - rgb values in config file
  # swaylock  - rgb values in config file
  # tofi      - rgb values in config file
  # waybar    - rgb values in config file
  # wob       - rgb values in config file

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
