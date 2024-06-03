{ ... }:
{
  # Zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
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
      df = "duf";
      ps = "procs";
      grep = "rg";
    };
    initExtra = ''
      bindkey "''${key[Up]}" up-line-or-search
      bindkey "''${key[Down]}" down-line-or-search
    '';
  };
  # Starship shell prompt
  programs.starship.enable = true;
  # Smarter cd
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd"
      "cd"
    ];
  };
  # Better ls
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--header"
      "--octal-permissions"
      "--group-directories-first"
    ];
  };
  # Fuzzy file finder
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux = {
      enableShellIntegration = true;
    };
  };
  # Directory-based environments
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
