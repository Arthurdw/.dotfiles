{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.kernelModules = [ "nvidia_uvm" ];

  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';

  networking.hostName = "compooter";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  hardware.enableAllFirmware = true;
  hardware.new-lg4ff.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input = {
      General = {
	ClassicBondedOnly = false;
	UserspaceHID = true;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.seahorse.enable = true;

  # TODO: Configure greetd
  services.greetd = {
    enable = false;
    settings.default_session = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "arthur";
      };
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland --config /home/arthur/.config/hypr/hyprland.conf";
        user = "greeter";
      };
    };
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.arthur = {
    isNormalUser = true;
    description = "arthur";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    geist-font
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager

    # General utils:
    kitty
    vim
    git
    zig
    gcc
    wl-clipboard
    cliphist
    poweralertd

    # Display/WM
    egl-wayland
    rofi-wayland
    waybar
    hyprpaper
    hyprshot
    hyprcursor
    hyprlock
    hypridle
    hyprpicker
    hyprsunset
    hyprpolkitagent
    hyprsysteminfo
    rose-pine-hyprcursor
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    adw-gtk3
    adwaita-icon-theme
    gsettings-desktop-schemas
    brightnessctl

    # Login manager
    rofi-power-menu
    greetd.greetd
    greetd.regreet

    # Notifications:
    dunst
    hyprpolkitagent

    # Audio:
    playerctl
    pavucontrol
    sof-firmware
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WAYLAND_DISPLAY = "1";

  virtualisation.docker.enable = true;
  services.gvfs.enable = true;
  services.fwupd.enable = true;


  programs.hyprland.enable = true;
  programs.hyprland.withUWSM  = true;
  programs.zsh.enable = true;
  programs.dconf.enable = true;
  services.blueman.enable = true;
  services.upower.enable = true;
  programs.nix-ld.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  services.udev.packages = [
    pkgs.yubikey-personalization
    pkgs.bluez
  ];

  # Yubikey support
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Audio config:
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Nvidia settings
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;

    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

      # TODO: check for specialisation profiles
      # Can't use offload and sync at the same time
      # offload = {
      #   enable = true;
      #   enableOffloadCmd = true;
      # };
      sync.enable = true;
      # TODO: experiment with reverseSync
      # reverseSync.enable = true;
    };

    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      gutenprintBin
      hplip
      hplipWithPlugin
      samsung-unified-linux-driver
      brlaser
      brgenml1lpr
      brgenml1cupswrapper
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  system.autoUpgrade = {
   enable = true;
   dates = "*-*-* 04:00:00";
   persistent = true;
   allowReboot = false;
  };

  nix.gc = {
   automatic = true;
   persistent = false;
   dates = "daily";
   options = "--delete-older-than 7d";
  };

  # Firewall
  networking.firewall.enable = true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 
    # Syncthing
    22000 21027
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
