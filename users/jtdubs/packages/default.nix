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
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })

    # cli tools
    duf # better df
    procs # better ps
    ripgrep # better grep
    xxd # hex dumper
    p7zip # 7z support
    podman-tui # podman terminal ui

    # utils
    feh # image viewer
    gnome.seahorse # keyring
    libnotify # desktop notifications
    nixpkgs-fmt # nix formatter
    pass # password store
    units # dimensional analysis
    appimage-run # run appimage apps
    remmina # windows remote desktop

    # sway utils
    brightnessctl # backlight control
    grim # screenshot tool
    pavucontrol # pulseaudio sound ui
    pulseaudio # pulseaudio
    slurp # screenshot tool
    wlay # output manager
    iwgtk # gui frontend for iwd
    wdisplays # wayland display config
  ]) ++ (with unstable; [

    inkscape # vector graphics
    blender # 3d modeling
    nerdfonts # fonts
  ]);
}
