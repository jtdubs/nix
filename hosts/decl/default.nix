{ disko, nixos-hardware, stable, unstable, ... }:
{
  imports =
    [
      nixos-hardware.nixosModules.framework-13th-gen-intel
      disko.nixosModules.disko
      ./disks.nix
      ./hardware-configuration.nix
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
  networking.hostName = "decl";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Users
  users.users.jtdubs = {
    isNormalUser = true;
    description = "Justin Dubs";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = stable.zsh;
    initialPassword = "jtdubs";
  };

  # Packages
  programs.zsh.enable = true;
  programs.sway.enable = true;
  environment.systemPackages = with stable; [
    brlaser
    curl
    foot
    home-manager
    git
    neovim
    sway
    swayidle
    swaylock
    tmux
    xdg-utils
    wl-clipboard
  ];

  # Environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

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

  # Fingerprint login
  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = true;

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
  hardware.printers = {
    ensurePrinters = [
      {
        name = "Brother_HL-L2370DW";
        location = "Home";
        deviceUri = "http://brw802bf96c8917.home.dubs.zone:631/ipp";
        model = "drv:///cupsfilters.drv/pwgrast.ppd";
      }
    ];
    ensureDefaultPrinter = "Brother_HL-L2370DW";
  };

  # NixOS Release
  system.stateVersion = "23.11";
}
