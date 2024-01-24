# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nixpkgs-unstable, nixpkgs-20-09, ... }:
let pkgs-20-09 = (import nixpkgs-20-09) {system = "x86_64-linux";};
    pkgs-unstable = (import nixpkgs-unstable) {system = "x86_64-linux"; config.allowUnfree = true;};
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Fix for the headphone jack mic
  boot.extraModprobeConfig = ''
    options snd-hda-intel index=1,0 model=auto,dell-headset-multi
  '';

  boot.initrd.luks.devices."luks-9d7ef2ab-cb4f-4579-9192-6cc7a51ba882".device = "/dev/disk/by-uuid/9d7ef2ab-cb4f-4579-9192-6cc7a51ba882";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.fprintd.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  programs.steam.enable = true;

  hardware.enableAllFirmware = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


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

  services.fwupd.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "jonny";
    };
    sddm.enable = true;
    sessionCommands = "export KDEWM=${pkgs.i3}/bin/i3";
  };
  services.xserver.desktopManager.plasma5 = {
    enable = true;
    runUsingSystemd = false;
  };
  services.picom = {
    enable = true;
    shadow = true;
    vSync = true;
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  services.qemuGuest.enable = true;
  virtualisation.kvmgt.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  #hardware.pulseaudio = {
  #  enable = true;
  #  package = pkgs.pulseaudioFull;
  #  extraConfig = "
  #    load-module module-switch-on-connect
  #  ";

  #};
  programs.dconf.enable = true;
  security.rtkit.enable = true;
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

  programs.fish.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jonny = {
    isNormalUser = true;
    description = "jonny";
    extraGroups = [ "networkmanager" "wheel" "audio" "kvm"];
    shell = pkgs.fish;
    packages = with pkgs; [
      firefox
      thunderbird
      wmctrl
      pkgs-20-09.git
      git-crypt
      direnv
      libreoffice
      cabal-install
      slack
      beekeeper-studio
      ripgrep
      pavucontrol
      evolution
      cloc
      librewolf
      qutebrowser
      ungoogled-chromium
      tor-browser-bundle-bin
      nodePackages.typescript-language-server
      protonvpn-gui
      protonmail-bridge
      gnumake
      gcc
      nodejs
      pkgs-unstable.bruno
      tmux
      ghc
      qemu
      kvmtool
      virtiofsd
      freerdp
      libvirt
    ];
  };

  fonts.packages = with pkgs; [
    hasklig
  ];

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim fish i3 alacritty rofi i3status xclip dnsutils
  ];


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

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 1234 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
