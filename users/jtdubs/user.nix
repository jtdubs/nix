{ pkgs, ... }:
{
  isNormalUser = true;
  description = "Justin Dubs";
  extraGroups = [ "networkmanager" "wheel" "audio" ];
  shell = pkgs.zsh;
}
