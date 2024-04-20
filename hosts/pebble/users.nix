{ stable, ... }:
{
  # Users
  users.users.jtdubs = {
    isNormalUser = true;
    description = "Justin Dubs";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = stable.zsh;
    initialPassword = "jtdubs";
  };
}
