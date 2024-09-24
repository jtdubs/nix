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
            "format": "<span rise='-2pt'>{:%a %b %d %r}</span>",
            "tooltip": false
        },
        "backlight": {
            "format": "{percent}% <span font='16' rise='-2pt'>{icon}</span>",
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
            "format": "{capacity}% <span font='16' rise='-2pt'>{icon}</span>",
            "format-charging": "{capacity}% <span font='16' rise='-2pt'></span>",
            "format-plugged": "{capacity}% <span font='16' rise='-2pt'></span>",
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
            "format-wifi": "{essid} <span font='16' rise='-2pt'></span>",
            "format-ethernet": "{ipaddr} <span font='16' rise='-2pt'>󰈀</span>",
            "format-disconnected": "",
            "tooltip": false,
            "on-click": "iwgtk"
        },
        "pulseaudio": {
            "format": "{volume}% <span font='16' rise='-2pt'>{icon}</span> {format_source}",
            "format-bluetooth": "{volume}% <span font='16' rise='-2pt'>{icon}</span> {format_source}",
            "format-bluetooth-muted": "󰖁 <span font='16' rise='-2pt'>{icon}</span> {format_source}",
            "format-muted": "<span font='16' rise='-2pt'>󰖁</span> {format_source}",
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
