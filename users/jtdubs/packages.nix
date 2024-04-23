{ stable, unstable, ... }:
{
  imports = [
    ./packages/alacritty
    ./packages/btop
    ./packages/mako
    ./packages/neovim
    ./packages/swaylock
    ./packages/sway
    ./packages/tmux
    ./packages/tofi
    ./packages/vscodium
    ./packages/waybar
    ./packages/wob
  ];

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
    slurp # screenshot tool
    wlay # output manager
  ]) ++ (with unstable; [

    blender # 3d modeling
    nerdfonts # fonts
  ]);
}
