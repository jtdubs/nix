{ lib, stable, vscode-extensions, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    plugins = with stable.tmuxPlugins; [
      better-mouse-mode
      prefix-highlight
      nord
    ];
    terminal = "tmux-256color";
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    historyLimit = 1000;
    extraConfig = lib.fileContents xdg/tmux/tmux.conf;
  };
}
