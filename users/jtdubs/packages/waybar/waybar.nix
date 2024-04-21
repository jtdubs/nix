{ config, stable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  imports = [
    ./waybar.config.nix
    ./waybar.style.nix
  ];
  home.packages = [ stable.waybar ];
}
