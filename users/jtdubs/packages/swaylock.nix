{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  xdg.configFile."swaylock/config".text = ''
    ignore-empty-password
    indicator-caps-lock
    color=#${palette.night0}
    inside-color=#${palette.night0}
    inside-wrong-color=#${palette.night0}
    inside-ver-color=#${palette.night0}
    inside-clear-color=#${palette.night0}
    separator-color=#${palette.snow2}
    line-color=#${palette.night0}
    ring-color=#${palette.snow2}
    key-hl-color=#${palette.frost1}
    ring-wrong-color=#${palette.auroraRed}
    text-wrong-color=#${palette.auroraRed}
    ring-ver-color=#${palette.frost2}
    text-ver-color=#${palette.frost2}
    ring-clear-color=#${palette.auroraOrange}
    text-clear-color=#${palette.auroraOrange}
    text-caps-lock-color=#${palette.snow2}
    line-uses-inside
  '';
}
