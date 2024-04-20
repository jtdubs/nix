{ lib, stable, unstable, vscode-extensions, ... }:
{
  imports = [
    ./neovim.nix
    ./shell.nix
    ./tmux.nix
    ./vscodium.nix
  ];

  # Home Manager info
  home = {
    username = "jtdubs";
    homeDirectory = "/home/jtdubs";
  };

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Packages
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
    nerdfonts # fonts
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
    wob # notification bars
  ]) ++ (with unstable; [
    alacritty # terminal emulator
    blender # 3d modeling
    btop # better top
  ]);

  # Large pointer
  home.pointerCursor = {
    name = "Adwaita";
    package = stable.gnome.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };

  # Config files
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  xdg.configFile = {
    # Folders
    "alacritty" = { source = xdg/alacritty; recursive = true; };
    "btop" = { source = xdg/btop; recursive = true; };
    "git" = { source = xdg/git; recursive = true; };
    "mako" = { source = xdg/mako; recursive = true; };
    "sway" = { source = xdg/sway; recursive = true; };
    "swaylock" = { source = xdg/swaylock; recursive = true; };
    "tofi" = { source = xdg/tofi; recursive = true; };
    "waybar" = { source = xdg/waybar; recursive = true; };
    "wob" = { source = xdg/wob; recursive = true; };
    # Files
    "starship.toml".source = xdg/starship.toml;
  };

  # Environment variables
  home.sessionVariables = {
    BROWSER = "google-chrome-stable";
    NIXOS_OZONE_WL = "1";
  };

  # Generate an HTML manual
  manual.html.enable = true;

  home.stateVersion = "23.11";
}
