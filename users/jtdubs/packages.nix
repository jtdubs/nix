{ stable, unstable, ... }:
{
  imports = [
    ./packages/alacritty/alacritty.nix
    ./packages/btop/btop.nix
    ./packages/mako/mako.nix
    ./packages/neovim/neovim.nix
    ./packages/swaylock/swaylock.nix
    ./packages/sway/sway.nix
    ./packages/tmux/tmux.nix
    ./packages/tofi/tofi.nix
    ./packages/vscodium/vscodium.nix
    ./packages/waybar/waybar.nix
    ./packages/wob/wob.nix
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
