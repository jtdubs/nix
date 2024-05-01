{ lib, stable, unstable, vscode-extensions, ... }:
{
  imports = [
    ./vscodium.keys.nix
    ./vscodium.extensions.nix
    ./vscodium.settings.nix
  ];
  programs.vscode = {
    enable = true;
    package = unstable.vscodium;
    mutableExtensionsDir = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
  };
  home.activation.install-vscode-theme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${stable.curl}/bin/curl -fSSL -o /tmp/theme.vsix https://github.com/jtdubs/nix-vscode-theme/releases/download/v0.0.1/nix-vscode-theme-0.0.1.vsix
    $DRY_RUN_CMD ${unstable.vscodium}/bin/codium --install-extension /tmp/theme.vsix
    $DRY_RUN_CMD rm -f /tmp/theme.vsix
  '';
}
