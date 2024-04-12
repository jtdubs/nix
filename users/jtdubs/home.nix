{ lib, pkgs, ... }:
{
  # Allow unfree packages.
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # Home Manager info
  home.username = "jtdubs";
  home.homeDirectory = "/home/jtdubs";
  home.stateVersion = "23.11";
  manual.html.enable = true;

  # Packages.
  home.packages = with pkgs; [
    alacritty
    brightnessctl
    btop
    curl
    fzf
    git
    gnome.seahorse
    google-chrome
    home-manager
    mako
    nerdfonts
    pass
    pavucontrol
    sway
    swayidle
    swaylock
    tmux
    tofi
    xdg-utils
    waybar
    wl-clipboard
    wob
  ];

  # Configuration.
  xdg.configFile = {
    # Folders
    "alacritty" = { source = xdg/alacritty; recursive = true; };
    "btop"      = { source = xdg/btop;      recursive = true; };
    "git"       = { source = xdg/git;       recursive = true; };
    "sway"      = { source = xdg/sway;      recursive = true; };
    "swaylock"  = { source = xdg/swaylock;  recursive = true; };
    "tmux"      = { source = xdg/tmux;      recursive = true; };
    "tofi"      = { source = xdg/tofi;      recursive = true; };
    "waybar"    = { source = xdg/waybar;    recursive = true; };
    # Files
    "starship.toml".source = xdg/starship.toml;
    "nvim/colors/custom-theme.vim".source = xdg/nvim/colors/custom-theme.vim;
  };

  # Environment variables.
  home.sessionVariables = {
    BROWSER = "google-chrome-stable";
    NIXOS_OZONE_WL = "1";
  };

  # Program config.
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
  programs.vscode.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = lib.fileContents xdg/nvim/init.vim;
    plugins = with pkgs.vimPlugins; [
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
}
