{ stable, ... }:
{
  programs.zsh.enable = true;
  programs.sway.enable = true;
  programs.nix-ld.enable = true;
  environment.systemPackages = with stable; [
    brlaser # printer drivers
    curl
    foot # sway's default shell
    home-manager # home-manager
    file
    git
    sway # tiling window manager
    swayidle
    swaylock
    tmux # terminal multiplexer
    xdg-utils
    wl-clipboard # wayland clipboard utils
    unzip
    usbutils
  ];
}
