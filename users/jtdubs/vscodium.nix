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
    mutableExtensionsDir = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
  };
}
