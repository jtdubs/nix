{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  xdg.configFile."btop/themes/nix.theme".text = ''
    # Colors should be in 6 or 2 character hexadecimal or single spaced rgb decimal: "#RRGGBB", "#BW" or "0-255 0-255 0-255"
    # example for white: "#ffffff", "#ff" or "255 255 255".

    # All graphs and meters can be gradients
    # For single color graphs leave "mid" and "end" variable empty.
    # Use "start" and "end" variables for two color gradient
    # Use "start", "mid" and "end" for three color gradient

    # Main background, empty for terminal default, need to be empty if you want transparent background
    theme [ main_bg ]="#${palette.night0}"

    # Main text color
    theme[main_fg]="#${palette.snow0}"

    # Title color for boxes
    theme[title]="#${palette.frost0}"

    # Highlight color for keyboard shortcuts
    theme[hi_fg]="#${palette.frost3}"

    # Background color of selected item in processes box
    theme[selected_bg]="#${palette.night3}"

    # Foreground color of selected item in processes box
    theme[selected_fg]="#${palette.snow2}"

    # Color of inactive/disabled text
    theme[inactive_fg]="#${palette.night3}"

    # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
    theme[proc_misc]="#${palette.frost3}"

    # Cpu box outline color
    theme[cpu_box]="#${palette.night3}"

    # Memory/disks box outline color
    theme[mem_box]="#${palette.night3}"

    # Net up/down box outline color
    theme[net_box]="#${palette.night3}"

    # Processes box outline color
    theme[proc_box]="#${palette.night3}"

    # Box divider line and small boxes line color
    theme[div_line]="#${palette.night3}"

    # Temperature graph colors
    theme[temp_start]="#${palette.frost2}"
    theme[temp_mid]="#${palette.frost1}"
    theme[temp_end]="#${palette.snow2}"

    # CPU graph colors
    theme[cpu_start]="#${palette.frost2}"
    theme[cpu_mid]="#${palette.frost1}"
    theme[cpu_end]="#${palette.snow2}"

    # Mem/Disk free meter
    theme[free_start]="#${palette.frost2}"
    theme[free_mid]="#${palette.frost1}"
    theme[free_end]="#${palette.snow2}"

    # Mem/Disk cached meter
    theme[cached_start]="#${palette.frost2}"
    theme[cached_mid]="#${palette.frost1}"
    theme[cached_end]="#${palette.snow2}"

    # Mem/Disk available meter
    theme[available_start]="#${palette.frost2}"
    theme[available_mid]="#${palette.frost1}"
    theme[available_end]="#${palette.snow2}"

    # Mem/Disk used meter
    theme[used_start]="#${palette.frost2}"
    theme[used_mid]="#${palette.frost1}"
    theme[used_end]="#${palette.snow2}"

    # Download graph colors
    theme[download_start]="#${palette.frost2}"
    theme[download_mid]="#${palette.frost1}"
    theme[download_end]="#${palette.snow2}"

    # Upload graph colors
    theme[upload_start]="#${palette.frost2}"
    theme[upload_mid]="#${palette.frost1}"
    theme[upload_end]="#${palette.snow2}"
  '';
}
