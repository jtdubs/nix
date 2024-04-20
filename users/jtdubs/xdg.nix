{ ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  xdg.configFile = {
    # Folders
    "btop" = { source = xdg/btop; recursive = true; };
    "git" = { source = xdg/git; recursive = true; };
    "mako" = { source = xdg/mako; recursive = true; };
    "swaylock" = { source = xdg/swaylock; recursive = true; };
    "tofi" = { source = xdg/tofi; recursive = true; };
    "waybar" = { source = xdg/waybar; recursive = true; };
    "wob" = { source = xdg/wob; recursive = true; };
    # Files
    "starship.toml".source = xdg/starship.toml;
  };
}
