{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  home.packages = [ unstable.alacritty ];
  xdg.configFile."alacritty/alacritty.toml".text = ''
    [colors]
    draw_bold_text_with_bright_colors = false

    [colors.primary]
    background = "#${palette.night0}"
    foreground = "#${palette.snow0}"
    dim_foreground = "#${palette.night3}"

    [colors.cursor]
    text = "#${palette.night0}"
    cursor = "#${palette.snow0}"

    [colors.vi_mode_cursor]
    text = "#${palette.night0}"
    cursor = "#${palette.snow0}"

    [colors.selection]
    text = "CellForeground"
    background = "#${palette.night3}"

    [colors.search.matches]
    foreground = "CellBackground"
    background = "#${palette.frost1}"

    [colors.normal]
    black = "#${palette.night1}"
    red = "#${palette.auroraRed}"
    green = "#${palette.auroraGreen}"
    yellow = "#${palette.auroraYellow}"
    blue = "#${palette.frost2}"
    magenta = "#${palette.auroraPurple}"
    cyan = "#${palette.frost1}"
    white = "#${palette.snow1}"

    [colors.bright]
    black = "#${palette.night3}"
    red = "#${palette.auroraRed}"
    green = "#${palette.auroraGreen}"
    yellow = "#${palette.auroraYellow}"
    blue = "#${palette.frost2}"
    magenta = "#${palette.auroraPurple}"
    cyan = "#${palette.frost0}"
    white = "#${palette.snow2}"

    [colors.dim]
    black = "#${palette.night0}"
    red = "#${palette.auroraRed}"
    green = "#${palette.auroraGreen}"
    yellow = "#${palette.auroraYellow}"
    blue = "#${palette.frost2}"
    magenta = "#${palette.auroraPurple}"
    cyan = "#${palette.frost2}"
    white = "#${palette.snow0}"

    [cursor]
    style = "Block"
    unfocused_hollow = true

    [env]
    TERM = "xterm-256color"

    [font]
    size = 12.0
    normal = { family = "FiraCode Nerd Font Mono" }
    bold = { family = "FiraCode Nerd Font Mono" }
    italic = { family = "FiraCode Nerd Font Mono" }

    [window]
    dynamic_padding = false
    padding = { x = 2, y = 2 }
  '';
}
