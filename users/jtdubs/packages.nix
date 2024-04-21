{ stable, unstable, ... }:
{
  imports = [
    ./packages/alacritty.nix
    ./packages/mako.nix
    ./packages/neovim/neovim.nix
    ./packages/swaylock.nix
    ./packages/sway.nix
    ./packages/tmux/tmux.nix
    ./packages/tofi.nix
    ./packages/vscodium/vscodium.nix
    ./packages/waybar/waybar.nix
    ./packages/wob.nix
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
    btop # better top
    nerdfonts # fonts
  ]);
}
