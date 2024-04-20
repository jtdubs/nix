{ stable, unstable, ... }:
{
  home.packages = (with stable; [
    # apps
    gimp
    google-chrome

    # cli tools
    fzf # fuzzy search

    # utils
    feh # image viewer
    gnome.seahorse # keyring
    libnotify # desktop notifications
    nixpkgs-fmt # nix formatter
    pass # password store
    units # dimensional analysis

    # sway utils
    brightnessctl # backlight control
    grim # screenshot tool
    pavucontrol # pulseaudio sound ui
    pulseaudio # pulseaudio
    mako # notification messages
    slurp # screenshot tool
    tofi # launch menu
    waybar # status bar
    wlay # output manager
  ]) ++ (with unstable; [

    blender # 3d modeling
    btop # better top
    nerdfonts # fonts
  ]);

}
