{ config, ... }:
let
  palette = config.colorScheme.palette;
in
{
  xdg.configFile."waybar/config".text = ''
    {
        "layer": "top",
        "position": "top",
        "height": 24,
        "spacing": 4,
        "modules-left": [
            "sway/workspaces",
            "sway/mode"
        ],
        "modules-center": [],
        "modules-right": [
            "pulseaudio",
            "backlight",
            "network",
            "battery",
            "clock"
        ],
        "sway/mode": {
            "format": "<span style=\"italic\">{}</span>"
        },
        "clock": {
            "interval": 1,
            "format": "{:%a %b %d %r}",
            "tooltip": false
        },
        "backlight": {
            "format": "{percent}% {icon}",
            "format-icons": [
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""
            ]
        },
        "battery": {
            "states": {
                "good": 90,
                "warning": 30,
                "critical": 10
            },
            "format": "{capacity}% {icon} ",
            "format-charging": "{capacity}% ",
            "format-plugged": "{capacity}% ",
            "format-icons": [
                "",
                "",
                "",
                "",
                ""
            ]
        },
        "network": {
            "format": "{ifname}",
            "format-wifi": "{essid} ",
            "format-ethernet": "{ipaddr} 󰈀",
            "format-disconnected": "",
            "tooltip": false,
            "on-click": "alacritty -e nmtui"
        },
        "pulseaudio": {
            "format": "{volume}% {icon} {format_source}",
            "format-bluetooth": "{volume}% {icon} {format_source}",
            "format-bluetooth-muted": "󰖁 {icon} {format_source}",
            "format-muted": "󰖁 {format_source}",
            "format-source": "",
            "format-source-muted": "",
            "format-icons": {
                "headphone": "",
                "hands-free": "",
                "headset": "",
                "phone": "",
                "portable": "",
                "car": "",
                "default": [
                    "",
                    "",
                    ""
                ]
            },
            "tooltip": false,
            "on-click": "pavucontrol"
        }
    }
  '';
}