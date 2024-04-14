{ lib, stable, unstable, ... }:
{
  # Home Manager info
  home = {
    username = "jtdubs";
    homeDirectory = "/home/jtdubs";
  };

  # Packages
  home.packages = (with stable; [
    # apps
    blender
    gimp
    google-chrome
    # cli tools
    fzf             # fuzzy search
    # utils
    feh             # image viewer
    libnotify       # desktop notifications
    gnome.seahorse  # keyring
    libnotify       # desktop notifications
    nerdfonts       # fonts
    nixpkgs-fmt     # nix formatter
    pass            # password store
    # sway utils
    brightnessctl   # backlight control
    grim            # screenshot tool
    pavucontrol     # pulseaudio sound ui
    pulseaudio      # pulseaudio
    mako            # notification messages
    slurp           # screenshot tool
    tofi            # launch menu
    waybar          # status bar
    wlay            # output manager
    wob             # notification bars
  ]) ++ (with unstable; [
    alacritty       # terminal emulator
    btop            # better top
    kanshi
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
    "kanshi" = { source = xdg/kanshi; recursive = true; };
    "mako" = { source = xdg/mako; recursive = true; };
    "sway" = { source = xdg/sway; recursive = true; };
    "swaylock" = { source = xdg/swaylock; recursive = true; };
    "tmux" = { source = xdg/tmux; recursive = true; };
    "tofi" = { source = xdg/tofi; recursive = true; };
    "waybar" = { source = xdg/waybar; recursive = true; };
    # Files
    "starship.toml".source = xdg/starship.toml;
    "nvim/colors/custom-theme.vim".source = xdg/nvim/colors/custom-theme.vim;
  };

  # Environment variables
  home.sessionVariables = {
    BROWSER = "google-chrome-stable";
    NIXOS_OZONE_WL = "1";
  };

  # Program config
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    history = {
      save = 1000;
      size = 1000;
      path = "$HOME/.history";
    };
    shellAliases = {
      x = "exit";
      vi = "nvim";
      enter = "nix-shell . --command zsh";
      t = "tmux new-session -A -s";
    };
    syntaxHighlighting = {
      enable = true;
    };
  };
  programs.starship.enable = true;
  programs.vscode = {
    enable = true;
    package = unstable.vscode;
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = lib.fileContents xdg/nvim/init.vim;
    plugins = with stable.vimPlugins; [
      securemodelines
      fzf-vim
      vim-rooter
      lightline-vim
      vim-highlightedyank
      vim-matchup
      vim-yaml
    ];
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # Services
  systemd.user.services.kanshi = {
    Unit = {
      Description = "Dynamic output configuration";
      Documentation = "man:kanshi(1)";
      PartOf = "graphical-session.target";
      After = "graphical-session-pre.target";
    };
    Service = {
      Type = "simple";
      ExecStart = "${stable.kanshi}/bin/kanshi";
      ExecStartPre = "/run/current-system/sw/bin/sleep 5";
    };
    Install.WantedBy = [ "sway-session.target" ];
  };
  systemd.user.targets.sway-session = {
    Unit = {
      Description = "Sway compositor session";
      Documentation = "man:systemd.special(7)";
      BindsTo="graphical-session.target";
      Wants="graphical-session-pre.target";
      After="graphical-session-pre.target";
    };
  };

  # Generate an HTML manual
  manual.html.enable = true;

  home.stateVersion = "23.11";
}
