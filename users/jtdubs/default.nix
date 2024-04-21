{ lib, stable, unstable, vscode-extensions, nix-colors, ... }:
{
  # Nord
  colorScheme = {
    slug = "nix";
    name = "Nix";
    author = "Justin Dubs <jtdubs@gmail.com>";
    palette = {
      # Polar Night
      base00 = "2E3440";
      base01 = "3B4252";
      base02 = "434C5E";
      base03 = "4C566A";
      # Snow Storm
      base04 = "D8DEE9";
      base05 = "E5E9F0";
      base06 = "ECEFF4";
      # Frost
      base07 = "8FBCBB";
      base0C = "88C0D0";
      base0D = "81A1C1";
      base0F = "5E81AC";
      # Aurora
      base08 = "BF616A"; # Red
      base09 = "D08770"; # Orange
      base0A = "EBCB8B"; # Yellow
      base0B = "A3BE8C"; # Green
      base0E = "B48EAD"; # Purple
    };
  };

  imports = [
    nix-colors.homeManagerModules.default
    ./cursor.nix
    ./environment.nix
    ./packages.nix
    ./shell.nix
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
