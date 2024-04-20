{ lib, unstable, vscode-extensions, ... }:
let
  extensions = with vscode-extensions.vscode-marketplace; [
    aaron-bond.better-comments
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    ms-vscode.cpptools-themes
    mkhl.direnv
    usernamehw.errorlens
    tamasfe.even-better-toml
    golang.go
    pinage404.nix-extension-pack
    arrterian.nix-env-selector
    jnoortheen.nix-ide
    arcticicestudio.nord-visual-studio-code
    please-build.plz-vscode
    ms-python.vscode-pylance
    ms-python.python
    ms-python.debugpy
    rust-lang.rust-analyzer
    vscodevim.vim
    polymeilex.wgsl
  ];
  userSettings = {
    "clangd.detectExtensionConflicts" = false;
    "clangd.path" =
      "/home/jtdubs/.config/Code/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/17.0.3/clangd_17.0.3/bin/clangd";
    "debug.allowBreakpointsEverywhere" = true;
    "editor.fontFamily" = "FiraCode Nerd Font Mono";
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
  keybindings = [
    {
      "key" = "ctrl+o";
      "command" = "workbench.action.gotoSymbol";
    }
    {
      "key" = "ctrl+h";
      "command" = "workbench.action.toggleSidebarVisibility";
    }
    {
      "key" = "ctrl+j";
      "command" = "workbench.action.terminal.focus";
    }
    {
      "key" = "ctrl+shift+j";
      "command" = "workbench.action.terminal.toggleTerminal";
    }
    {
      "key" = "ctrl+k ctrl+k";
      "command" = "workbench.action.focusLastEditorGroup";
    }
    {
      "key" = "ctrl+p ctrl+n";
      "command" = "editor.action.marker.next";
      "when" = "editorFocus";
    }
    {
      "key" = "ctrl+p ctrl+p";
      "command" = "editor.action.marker.prev";
      "when" = "editorFocus";
    }
    {
      "key" = "ctrl+p ctrl+shift+n";
      "command" = "editor.action.marker.nextInFiles";
      "when" = "editorFocus";
    }
    {
      "key" = "ctrl+p ctrl+shift+p";
      "command" = "editor.action.marker.prevInFiles";
      "when" = "editorFocus";
    }
  ];
in {
  programs.vscode = {
    enable = true;
    package = unstable.vscodium;
    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    userSettings = userSettings;
    keybindings = keybindings;
    extensions = extensions;
  };
}
