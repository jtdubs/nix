{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  xdg.configFile."swaylock/config".text = ''
    ignore-empty-password
    indicator-caps-lock
    color=#${palette.base00}
    inside-color=#${palette.base00}
    inside-wrong-color=#${palette.base00}
    inside-ver-color=#${palette.base00}
    inside-clear-color=#${palette.base00}
    separator-color=#${palette.base06}
    line-color=#${palette.base00}
    ring-color=#${palette.base06}
    key-hl-color=#${palette.base0C}
    ring-wrong-color=#${palette.base08}
    text-wrong-color=#${palette.base08}
    ring-ver-color=#${palette.base0D}
    text-ver-color=#${palette.base0D}
    ring-clear-color=#${palette.base09}
    text-clear-color=#${palette.base09}
    text-caps-lock-color=#${palette.base06}
    line-uses-inside
  '';
}
