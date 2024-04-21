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
    text-color = #${palette.snow0}
    prompt-color = #${palette.snow0}
    placeholder-color = #${palette.snow0}
    input-color = #${palette.snow0}
    default-result-color = #${palette.frost3}
    selection-color = #${palette.frost1}
    selection-background = #${palette.night2}

    # Layout
    prompt-text = "run: "

    # Window
    width = 320
    height = 480
    background-color = #${palette.night0}
    outline-width = 0
    border-width = 2
    border-color = #${palette.snow0}
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
