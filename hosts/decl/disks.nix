# sudo nix \
#   --experimental-features "nix-command flakes" \
#   run github:nix-community/disko               \
#   --                                           \
#   --mode disko                                 \
#   disks.nix
{
  disko.devices = {
    disk = {
      primary = {
        device = "/dev/disk/by-id/nvme-WD_BLACK_SN850X_2000GB_23252T801492";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              type = "EF00";
              size = "512M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
