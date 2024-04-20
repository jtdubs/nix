{ ... }:
{
  programs.vscode.userSettings = {
    "clangd.detectExtensionConflicts" = false;
    "clangd.path" =
      "/home/jtdubs/.config/Code/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/17.0.3/clangd_17.0.3/bin/clangd";
    "debug.allowBreakpointsEverywhere" = true;
    "editor.fontFamily" = "CommitMono Nerd Font";
    "editor.fontSize" = 12;
    "editor.formatOnPaste" = true;
    "editor.formatOnSave" = true;
    "editor.minimap.enabled" = false;
    "explorer.confirmDelete" = false;
    "explorer.confirmDragAndDrop" = false;
    "extensions.experimental.affinity" = { "vscode.vim" = 1; };
    "git.autofetch" = true;
    "git.enableSmartCommit" = true;
    "go.toolsManagement.autoUpdate" = true;
    "rust-analyzer.inlayHints.parameterHints.enable" = false;
    "rust-analyzer.inlayHints.typeHints.hideNamedConstructor" = true;
    "rust-analyzer.procMacro.enable" = true;
    "terminal.integrated.shell.windows" = "pwsh.exe";
    "terminal.integrated.shellArgs.windows" = "-NoLogo";
    "vim.enableNeovim" = false;
    "vim.handleKeys" = {
      "<C-e>" = false;
      "<C-o>" = false;
      "<C-p>" = false;
    };
    "window.titleBarStyle" = "custom";
    "workbench.colorTheme" = "Nord";
    "workbench.startupEditor" = "none";
    "[rust]" = { "editor.defaultFormatter" = "rust-lang.rust-analyzer"; };
    "editor.wordWrap" = "off";
    "cmake.showOptionsMovedNotification" = false;
    "terminal.integrated.fontFamily" = "monospace";
  };
}
