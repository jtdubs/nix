{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  # Notification bars
  home.packages = [ unstable.wob ];
  xdg.configFile."wob/wob.ini".text = ''
    border_color = ${palette.base04}
    background_color = ${palette.base00}
    bar_color = ${palette.base0F}
  '';
}
