{ config, stable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  # Launch menu
  home.packages = [ stable.tofi ];
  xdg.configFile."tofi/config".text = ''
    # Fonts
    font = "FiraCode Nerd Font Mono"
    font-size = 10
    hint-font = true

    # Text theming
    text-color = #${palette.base04}
    prompt-color = #${palette.base04}
    placeholder-color = #${palette.base04}
    input-color = #${palette.base04}
    default-result-color = #${palette.base0F}
    selection-color = #${palette.base0C}
    selection-background = #${palette.base02}

    # Layout
    prompt-text = "run: "

    # Window
    width = 320
    height = 480
    background-color = #${palette.base00}
    outline-width = 0
    border-width = 2
    border-color = #${palette.base04}
    padding-top = 4
    padding-bottom = 4
    padding-left = 4
    padding-right = 4
    clip-to-padding = true
    scale = true

    # Window positioning
    output = ""
    anchor = center
    exclusive-zone = -1

    # Behavior
    hide-cursor = false
    text-cursor = false
    history = true
    require-match = true
    auto-accept-single = false
    hide-input = false
    physical-keybindings = true
    print-index = false
    drun-launch = false
    late-keyboard-init = false
    multi-instance = false
    ascii-input = false
  '';
}
