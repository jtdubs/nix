{ config, unstable, ... }:
let
  palette = config.colorScheme.palette;
in
{
  xdg.configFile."sway/config".text = ''
    include /etc/sway/config-vars.d/*

    ## Variables
    set $mod   Mod4
    set $left  h
    set $down  j
    set $up    k
    set $right l

    ## Defaults
    smart_borders  on
    smart_gaps     on
    floating_modifier $mod normal
    focus_follows_mouse no

    # No titles ever
    default_border pixel 2
    font pango:monospace 0
    titlebar_border_thickness 0
    titlebar_padding 0

    # Theme
    set $bright #${palette.base03}
    set $dark #${palette.base00}
    set $text #${palette.base06}
    client.focused $bright $bright $text
    client.focused_inactive $dark $dark $text
    client.unfocused $dark $dark $text
    client.background $dark

    # Bar
    bar swaybar_command waybar

    # Wob
    set $WOBSOCK $XDG_RUNTIME_DIR/wob.sock
    exec_always {
      pkill wob
      rm &-f $WOBSOCK
      mkfifo $WOBSOCK
      tail -f $WOBSOCK | wob
    }

    ## Inputs
    input "type:keyboard" {
        xkb_numlock enabled
        xkb_options caps:escape
    }

    input "type:touchpad" {
        dwt disabled
    }

    ## Outputs
    output * bg #2e3440 solid_color

    set $laptop "eDP-1"

    output $laptop {
        mode 2256x1504@59.999Hz
        position 1920 0
        scale 2
        scale_filter smart
    }

    output "DP-1" {
        mode 3840x2160@60Hz
        position 0 0
        scale 2
        scale_filter smart
    }

    output "DP-4" {
        mode 3840x2160@60Hz
        position 0 0
        scale 2
        scale_filter smart
    }

    focus output "DP-1"
    focus output "DP-4"

    workspace 1 output "DP-1"
    workspace 1 output "DP-4"
    workspace 2 output $laptop

    bindswitch --reload --locked lid:on output $laptop disable
    bindswitch --reload --locked lid:off output $laptop enable

    ## Default mode
    mode "default" {
        # Launch apps
        bindsym $mod+Return  exec alacritty
        bindsym $mod+c       exec google-chrome-stable
        bindsym $mod+r       exec tofi-run  | xargs swaymsg exec --
        bindsym $mod+Shift+r exec tofi-drun | xargs swaymsg exec --

        # Function keys
        bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK
        bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+ | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK
        bindsym --locked XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle && ( [ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: yes" ] && echo 0 > $WOBSOCK ) || pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print substr($5,1,length($5)-1)}' > $WOBSOCK
        bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print substr($5,1,length($5)-1)}' > $WOBSOCK
        bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print substr($5,1,length($5)-1)}' > $WOBSOCK
        bindsym --locked XF86AudioMedia exec google-chrome-stable
        bindsym --locked Print exec grim
        bindsym --locked $mod+Print exec grim -g "$(slurp -d)"

        # Kill window
        bindsym $mod+w kill

        # Reload config
        bindsym $mod+Shift+c reload

        # Logout / Lock
        bindsym $mod+ctrl+Shift+l exec swaylock
        bindsym $mod+Shift+q      exec swaymsg exit

        # Layout
        bindsym $mod+f fullscreen
        bindsym $mod+b splith
        bindsym $mod+v splitv
        bindsym $mod+a focus parent
        bindsym $mod+space layout toggle splith splitv stacking

        # Floating layout
        bindsym $mod+Shift+t floating toggle
        bindsym $mod+t focus mode_toggle

        # Move focus
        bindsym $mod+$left focus left
        bindsym $mod+$down focus down
        bindsym $mod+$up focus up
        bindsym $mod+$right focus right
        bindsym $mod+Left focus left
        bindsym $mod+Down focus down
        bindsym $mod+Up focus up
        bindsym $mod+Right focus right

        # Move focused window
        bindsym $mod+Shift+$left move left
        bindsym $mod+Shift+$down move down
        bindsym $mod+Shift+$up move up
        bindsym $mod+Shift+$right move right
        bindsym $mod+Shift+Left move left
        bindsym $mod+Shift+Down move down
        bindsym $mod+Shift+Up move up
        bindsym $mod+Shift+Right move right

        # Switch to workspace
        bindsym $mod+1 workspace number 1
        bindsym $mod+2 workspace number 2
        bindsym $mod+3 workspace number 3
        bindsym $mod+4 workspace number 4
        bindsym $mod+5 workspace number 5
        bindsym $mod+6 workspace number 6
        bindsym $mod+7 workspace number 7
        bindsym $mod+8 workspace number 8
        bindsym $mod+9 workspace number 9
        bindsym $mod+0 workspace number 10

        # Move container to workspace
        bindsym $mod+Shift+1 move container to workspace number 1
        bindsym $mod+Shift+2 move container to workspace number 2
        bindsym $mod+Shift+3 move container to workspace number 3
        bindsym $mod+Shift+4 move container to workspace number 4
        bindsym $mod+Shift+5 move container to workspace number 5
        bindsym $mod+Shift+6 move container to workspace number 6
        bindsym $mod+Shift+7 move container to workspace number 7
        bindsym $mod+Shift+8 move container to workspace number 8
        bindsym $mod+Shift+9 move container to workspace number 9
        bindsym $mod+Shift+0 move container to workspace number 10

        # Resize
        bindsym $mod+ctrl+$left resize shrink width 10px
        bindsym $mod+ctrl+$down resize grow height 10px
        bindsym $mod+ctrl+$up resize shrink height 10px
        bindsym $mod+ctrl+$right resize grow width 10px
        bindsym $mod+ctrl+Left resize shrink width 10px
        bindsym $mod+ctrl+Down resize grow height 10px
        bindsym $mod+ctrl+Up resize shrink height 10px
        bindsym $mod+ctrl+Right resize grow width 10px
    }

    include /etc/sway/config.d/*
  '';
}
