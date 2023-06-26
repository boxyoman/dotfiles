{ pkgs, ... }:
let
  nix-20-09 = import <nix-20.09> {};
in {

  imports = [ <home-manager/nix-darwin> ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.fish pkgs.nethack pkgs.direnv nix-20-09.nixops
      pkgs.neovim nix-20-09.git pkgs.git-crypt pkgs.fzf pkgs.ripgrep pkgs.niv
    ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.package = pkgs.nix;


  users.users.Jonny.home = "/Users/Jonny";


  home-manager = {
    users.Jonny = {
      home.stateVersion = "23.05";
      programs.direnv.enable = true;
      programs.direnv.nix-direnv.enable = true;
    };
  };

  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
  };

  environment.pathsToLink = [
    "/share/nix-direnv"
  ];


  nix.settings.substituters = [
    "https://cache.iog.io"
    "https://cache.nixos.org"
  ];
  nix.settings.trusted-public-keys = [
    "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = true;
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu


}
