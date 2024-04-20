{ stable, ... }:
{
  # GUI
  services = {
    gnome.gnome-keyring.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
      displayManager.sessionPackages = [ stable.sway ];
    };
  };
  hardware = {
    enableAllFirmware = true;
    opengl = {
      enable = true;
      driSupport = true;
    };
  };
}
