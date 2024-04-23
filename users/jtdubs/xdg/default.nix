{ ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  xdg.configFile = {
    # Folders
    "git" = { source = ./git; recursive = true; };
    # Files
    "starship.toml".source = ./starship.toml;
  };
}
