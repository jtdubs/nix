{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell rec {
  buildInputs = with pkgs; [
    nodejs
  ];
  shellHook = ''
    export PATH=$PATH:$PWD/node_modules/.bin/
    npm config set cache $PWD/.npm
    '';
}
