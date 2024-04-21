{ ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  xdg.configFile = {
    # Folders
    "git" = { source = xdg/git; recursive = true; };
    # Files
    "starship.toml".source = xdg/starship.toml;
  };
}
