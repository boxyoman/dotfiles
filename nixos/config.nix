# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nixpkgs-unstable, nixpkgs-20-09, zen-browser, system, ... }:
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

  services.fprintd.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  programs.steam.enable = true;

  programs.nix-ld.enable = true;

  hardware.enableAllFirmware = true;

  services.gvfs.enable = true;

  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
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

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "Dracula";
    };
  };

  # programs.uwsm.enable = true;

  programs.hyprlock = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # withUWSM = true;
  };
  programs.nm-applet.enable = true;
  programs.waybar.enable = true;

  services.picom = {
    enable = true;
    shadow = true;
    vSync = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  services.qemuGuest.enable = true;
  virtualisation.kvmgt.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.dconf.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.fish.enable = true;

  # security.wrappers.spice-client-glib-usb-acl-helper.source =
  #   "${pkgs.spice-gtk}/bin/spice-client-glib-usb-acl-helper";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  security.pam.services.jonny.kwallet.enable = true;
  users.users.jonny = {
    isNormalUser = true;
    description = "jonny";
    extraGroups = [ "networkmanager" "wheel" "audio" "kvm" "docker"];
    shell = pkgs.fish;
    packages = with pkgs; [
      firefox
      pkgs-unstable.thunderbird
      pkgs-unstable.zig
      pkgs-unstable.zls
      pkgs-unstable.odin
      pkgs-unstable.ols
      imagemagick
      jpegoptim
      wmctrl
      pkgs-20-09.git
      git-crypt
      direnv
      libreoffice
      cabal-install
      slack
      ripgrep
      pavucontrol
      cloc
      librewolf
      qutebrowser
      ungoogled-chromium
      typescript
      nodePackages.typescript-language-server
      gnumake
      gcc
      nodejs
      pkgs-unstable.bruno
      tmux
      ghc
      haskell.compiler.ghc9102
      qemu
      kvmtool
      virtiofsd
      freerdp
      libvirt
      cabal2nix
      openssl
      jdk21
      jdk17
      prismlauncher
      luanti
      wireguard-tools
      appimage-run
      lutris
      wine
      srm
      mumble
      restic
      unzip
      krita
      networkmanagerapplet
      waybar
      rofi
      xdg-desktop-portal-hyprland
      wl-clipboard
      swaynotificationcenter
      nwg-look
      dconf-editor
      rofi-bluetooth
      haskellPackages.cabal-plan
      protonvpn-gui
      pkgs-unstable.tor-browser
      cider
      hyprlock
      hyprsunset
      zen-browser.packages.x86_64-linux.twilight
      discord
      tree
      python313
      lua
      haskellPackages.eventlog2html
      dbeaver-bin
      hurl
      jq
      vintagestory
      anytype
      networkmanager_dmenu
      protonmail-bridge-gui
      kdePackages.kwallet
      kdePackages.kwalletmanager
      feh
      traceroute
      dpkg
      steam-run
      entr
      postgresql_18
      raylib
    ];
  };

  qt.enable = true;
  qt.platformTheme = "gtk2";
  qt.style = "breeze";

  fonts.packages = with pkgs; [
    hasklig font-awesome
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    package = pkgs-unstable.tailscale;
  };

  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20" ## for vintage story
  ];


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pkgs-unstable.neovim fish alacritty dnsutils
    hyprpolkitagent hyprshot
    cifs-utils samba4Full
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";



  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8080 ];
  networking.firewall.allowedUDPPorts = [ 5520 ];

  services.restic.backups.backup = {
    user = "jonny";
    repository = "sftp:boxyoman@10.0.3.106:/home/Backups/framework";
    passwordFile = "/restic/password";
    paths = [
      "/home/jonny/"
    ];
    timerConfig = {
      OnCalendar = "hourly";
    };
  };

#  networking.wireguard.interfaces = {
#    # "wg0" is the network interface name. You can name the interface arbitrarily.
#    wg0 = {
#      # Determines the IP address and subnet of the client's end of the tunnel interface.
#      ips = [ "10.50.0.71/32" ];
#      listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

#      # Path to the private key file.
#      #
#      # Note: The private key can also be included inline via the privateKey option,
#      # but this makes the private key world-readable; thus, using privateKeyFile is
#      # recommended.
#      privateKeyFile = "/home/jonny/wireguard-keys/private";
#      peers = [
#        {
#          publicKey = "TCE5NDddmuBi327F91+VOCUj8BiwhlDP4I0Jxb4u1AQ=";
#          allowedIPs = [ "10.50.0.0/24" ];
#          endpoint = "68.46.175.71:51820";
#          persistentKeepalive = 25;
#        }
#      ];
#    };
#  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
