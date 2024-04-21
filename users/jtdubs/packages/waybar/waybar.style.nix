{ config, ... }:
let
  palette = config.colorScheme.palette;
in
{
  xdg.configFile."waybar/style.css".text = ''
    * {
        border: none;
        border-radius: 0;
        font-family: FiraCode Nerd Font Mono;
        font-size: 14px;
        min-height: 0;
    }

    window#waybar {
        background-color: #${palette.night0};
        color: #${palette.snow2};
        transition-property: background-color;
        transition-duration: .5s;
    }

    tooltip {
        background: #${palette.night0};
        border: 1px solid #${palette.night3};
    }

    tooltip label {
        color: #${palette.snow2};
    }

    #workspaces button {
        padding: 0 8px;
        background-color: transparent;
        color: #${palette.snow2};
        border-bottom: 3px solid transparent;
    }

    #workspaces button:hover {
        background: #${palette.night2};
        box-shadow: inherit;
        border-bottom: 3px solid #${palette.snow2};
    }

    #workspaces button.focused {
        background-color: #${palette.night3};
        border-bottom: 3px solid #${palette.snow2};
    }

    #workspaces button.urgent {
        background-color: #${palette.auroraOrange};
    }

    #mode,
    #clock,
    #battery,
    #pulseaudio,
    #backlight,
    #network {
        padding: 0 10px;
        margin: 0 4px;
        color: #${palette.snow2};
    }

    .icon {
        font-size: 18px;
    }

    @keyframes blink {
        to {
            color: #${palette.snow2};
        }
    }

    #battery.warning:not(.charging) {
        background: #${palette.auroraRed};
        color: #${palette.snow2};
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }
  '';
}
