{ config, stable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  # Notification messages
  home.packages = [ stable.mako ];
  xdg.configFile."mako/config".text = ''
    font=FiraCode Nerd Font Mono
    background-color=#${palette.frost3}
    text-color=#${palette.night0}
    border-color=#${palette.snow0}
    default-timeout=4000
  '';
}
