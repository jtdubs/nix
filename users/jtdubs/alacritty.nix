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
    background = "#${palette.base00}"
    foreground = "#${palette.base04}"
    dim_foreground = "#${palette.base03}"

    [colors.cursor]
    text = "#${palette.base00}"
    cursor = "#${palette.base04}"

    [colors.vi_mode_cursor]
    text = "#${palette.base00}"
    cursor = "#${palette.base04}"

    [colors.selection]
    text = "CellForeground"
    background = "#${palette.base03}"

    [colors.search.matches]
    foreground = "CellBackground"
    background = "#${palette.base0C}"

    [colors.normal]
    black = "#${palette.base01}"
    red = "#${palette.base08}"
    green = "#${palette.base0B}"
    yellow = "#${palette.base0A}"
    blue = "#${palette.base0D}"
    magenta = "#${palette.base0E}"
    cyan = "#${palette.base0C}"
    white = "#${palette.base05}"

    [colors.bright]
    black = "#${palette.base03}"
    red = "#${palette.base08}"
    green = "#${palette.base0B}"
    yellow = "#${palette.base0A}"
    blue = "#${palette.base0D}"
    magenta = "#${palette.base0E}"
    cyan = "#${palette.base07}"
    white = "#${palette.base06}"

    [colors.dim]
    black = "#${palette.base00}"
    red = "#${palette.base08}"
    green = "#${palette.base0B}"
    yellow = "#${palette.base0A}"
    blue = "#${palette.base0D}"
    magenta = "#${palette.base0E}"
    cyan = "#${palette.base0D}"
    white = "#${palette.base04}"

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
