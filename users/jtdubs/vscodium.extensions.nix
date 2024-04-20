{ vscode-extensions, ... }:
{
  programs.vscode.extensions = with vscode-extensions.vscode-marketplace; [
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
}
