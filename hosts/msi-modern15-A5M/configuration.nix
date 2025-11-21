# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General.Experimental = true;
    };
  };
  services.blueman.enable = true;
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [
      "network.target"
      "sound.target"
    ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };

  virtualisation = {
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
    # virtualbox = {
    #   host.enable = true;
    #   guest.enable = true;
    #   guest.dragAndDrop = true;
    # };
  };

  users.extraGroups.vboxusers.members = [ "oung" ];

  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true; # Enable networking
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://127.0.0.1:2080/";
    proxy.noProxy = lib.strings.concatStringsSep "," [
      "127.0.0.1"
      "192.168.0.0/16"
      "103.186.240.90"
      "localhost"
      "internal.domain"
      "youtube.com"
      "teams.microsoft.com"
      "microsoft.com"
      "reddit.com"

      "cloud.langfuse.com"
      "api.openai.com"
      "openai.com"
      "api-inference.huggingface.co"
      "huggingface.co"
      "registry.npmjs.org"
      "npmjs.org"
      "api.cohere.com"
      "cohere.com"
      "generativelanguage.googleapis.com"
      "googleapis.com"
      "api.anthropic.com"
      "anthropic.com"
    ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Yangon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };

    };

    # desktopManager.gnome.enable = true;

    displayManager.gdm = {
      enable = true;
    };

    # displayManager.sddm = {
    #   enable = true;
    #   enableHidpi = true;
    #   theme = "catppuccin-mocha-mauve"; # Theme name corresponds to the overridden package's theme name
    # };

    # Enable CUPS to print documents.
    # printing.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.oung = {
      isNormalUser = true;
      description = "Min Aung Thu Win";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
      packages = [ ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # (pkgs.catppuccin-sddm.override {
    #   flavor = "mocha";
    #   accent = "mauve";
    # })

    gdm
    openvpn
    curl
    clang
    gcc
    obs-studio
    git
    home-manager
    wget
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    ssh = {
      enableAskPassword = false;
      askPassword = "systemd-ask-password";
    };

    gamemode.enable = true;

    hyprland.enable = true;
    niri.enable = true;
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
    zsh.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    4173
    5173
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    settings.auto-optimise-store = true;
    settings.experimental-features = [
      "pipe-operators"
      "nix-command"
      "flakes"
    ];
  };
  system.stateVersion = "25.05";
}
