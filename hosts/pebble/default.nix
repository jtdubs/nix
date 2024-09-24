{ disko, nixos-hardware, stable, ... }:
{
  imports =
    [
      nixos-hardware.nixosModules.framework-13th-gen-intel
      disko.nixosModules.disko
      ./audio.nix
      ./disks.nix
      ./environment.nix
      ./fingerprint.nix
      ./gui.nix
      ./hardware-configuration.nix
      ./locale.nix
      ./packages.nix
      ./printing.nix
      ./users.nix
    ];

  # Nix settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = stable.linuxPackagesFor stable.linux_latest;

  # Security
  security.polkit.enable = true;
  security.rtkit.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Networking
  networking.hostName = "pebble";
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
  networking.wireless.iwd =
    {
      enable = true;
      settings = {
        Settings = {
          AutoConnect = true;
        };
      };
    };

  # Virtualization
  virtualisation.containers = {
    enable = true;
    registries.search = [ ];
  };
  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    dockerCompat = true;
  };
  virtualisation.oci-containers.backend = "podman";

  # NixOS Release
  system.stateVersion = "23.11";
}
