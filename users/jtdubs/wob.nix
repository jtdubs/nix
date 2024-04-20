{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  # Notification bars
  home.packages = [ unstable.wob ];
  xdg.configFile."wob/wob.ini".text = ''
    border_color = D8DEE9
    background_color = 2E3440
    bar_color = 5E81AC
  '';
}
