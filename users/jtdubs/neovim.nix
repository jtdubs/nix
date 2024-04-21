{ lib, stable, unstable, ... }:
{
  imports = [
    ./neovim.theme.nix
  ];
  programs.neovim = {
    enable = true;
    package = unstable.neovim-unwrapped;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = lib.fileContents xdg/nvim/init.vim;
    plugins = with unstable.vimPlugins; [
      securemodelines
      fzf-vim
      vim-rooter
      lualine-nvim
      nvim-web-devicons
      vim-highlightedyank
      vim-matchup
      vim-yaml
    ];
  };
}
