{ config, pkgs, inputs, outputs, ... }:
{
  imports =
    [
      inputs.nixos-hardware.nixosModules.framework-13th-gen-intel
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
  boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;

  # Security
  security.polkit.enable = true;
  security.rtkit.enable = true;

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
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  # Packages
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    curl
    git
    neovim
    sway
    swayidle
    swaylock
    tmux
    xdg-utils
    wl-clipboard
  ];

  # GUI
  services = {
    gnome.gnome-keyring.enable = true;
    xserver = {
      layout = "us";
      xkbVariant = "";
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = "greeter";
          command = ''
            ${pkgs.greetd.tuigreet}/bin/tuigreet \
              --time \
              --asterisks \
              --user-menu \
              --cmd sway
          '';
        };
      };
    };
  };
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVDisallocate = true;
  };
  hardware = {
    enableAllFirmware = true;
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # NixOS Release
  system.stateVersion = "23.11";
}
