{ stable, ... }:
{
  # GUI
  services = {
    gnome.gnome-keyring.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      displayManager = {
        gdm.enable = true;
        gdm.wayland = true;
      };
    };
    displayManager = {
      sessionPackages = [ stable.sway ];
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
