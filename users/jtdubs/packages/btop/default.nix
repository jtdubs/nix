{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  imports = [
    ./btop.theme.nix
  ];
  home.packages = [ unstable.btop ];
  xdg.configFile."btop/btop.conf".source = ./btop.conf;
}
