{ pkgs, ... }:
let
  nix-20-09 = import <nix-20.09> {};
in {


  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.fish pkgs.nethack pkgs.direnv nix-20-09.nixops pkgs.neovim
      nix-20-09.git pkgs.git-crypt pkgs.fzf pkgs.ripgrep
    ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = true;
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu


}
