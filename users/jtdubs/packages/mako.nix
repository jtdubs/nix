{ config, stable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  # Notification messages
  home.packages = [ stable.mako ];
  xdg.configFile."mako/config".text = ''
    font=FiraCode Nerd Font Mono
    background-color=#${palette.base0F}
    text-color=#${palette.base00}
    border-color=#${palette.base04}
    default-timeout=4000
  '';
}
