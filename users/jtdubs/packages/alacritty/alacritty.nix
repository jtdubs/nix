{ unstable, ... }:
{
  imports = [
    ./alacritty.theme.nix
  ];
  home.packages = [ unstable.alacritty ];
}
