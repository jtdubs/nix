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
        background-color: #${palette.base00};
        color: #${palette.base06};
        transition-property: background-color;
        transition-duration: .5s;
    }

    tooltip {
        background: #${palette.base00};
        border: 1px solid #${palette.base03};
    }

    tooltip label {
        color: #${palette.base06};
    }

    #workspaces button {
        padding: 0 8px;
        background-color: transparent;
        color: #${palette.base06};
        border-bottom: 3px solid transparent;
    }

    #workspaces button:hover {
        background: #${palette.base02};
        box-shadow: inherit;
        border-bottom: 3px solid #${palette.base06};
    }

    #workspaces button.focused {
        background-color: #${palette.base03};
        border-bottom: 3px solid #${palette.base06};
    }

    #workspaces button.urgent {
        background-color: #${palette.base09};
    }

    #mode,
    #clock,
    #battery,
    #pulseaudio,
    #backlight,
    #network {
        padding: 0 10px;
        margin: 0 4px;
        color: #${palette.base06};
    }

    @keyframes blink {
        to {
            color: #${palette.base06};
        }
    }

    #battery.warning:not(.charging) {
        background: #${palette.base08};
        color: #${palette.base06};
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }
  '';
}
