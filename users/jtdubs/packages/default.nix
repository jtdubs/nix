{ stable, unstable, ... }:
{
  imports = [
    ./alacritty
    ./btop
    ./mako
    ./neovim
    ./swaylock
    ./sway
    ./tmux
    ./tofi
    ./vscodium
    ./waybar
    ./wob
  ];

  home.packages = (with stable; [
    # apps
    gimp
    google-chrome

    # cli tools
    duf # better df
    procs # better ps
    ripgrep # better grep

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
    slurp # screenshot tool
    wlay # output manager
  ]) ++ (with unstable; [

    blender # 3d modeling
    nerdfonts # fonts
  ]);
}
