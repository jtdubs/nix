{ lib, unstable, vscode-extensions, ... }:
{
  imports = [
    ./vscodium.keys.nix
    ./vscodium.extensions.nix
    ./vscodium.settings.nix
  ];
  programs.vscode = {
    enable = true;
    package = unstable.vscodium;
    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
  };
}
