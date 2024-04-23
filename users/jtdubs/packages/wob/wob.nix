{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  # Notification bars
  home.packages = [ unstable.wob ];
  xdg.configFile."wob/wob.ini".text = ''
    border_color = ${palette.snow0}
    background_color = ${palette.night0}
    bar_color = ${palette.frost3}
  '';
}
