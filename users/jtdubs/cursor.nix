{ stable, ... }:
{
  # Large pointer
  home.pointerCursor = {
    name = "Adwaita";
    package = stable.gnome.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };
}
