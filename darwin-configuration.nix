{ pkgs, ... }:
let
  nix-20-09 = import <nix-20.09> {};
  nix-unstable = import <unstable> {};
in {

  imports = [ <home-manager/nix-darwin> ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.fish pkgs.nethack pkgs.direnv nix-20-09.nixops
      pkgs.neovim nix-20-09.git pkgs.git-crypt pkgs.fzf pkgs.ripgrep pkgs.niv
      pkgs.nodejs pkgs.postgresql_15 nix-unstable.zig_0_11 nix-unstable.zls
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


  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = true;
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # services.postgresql = {
  #   enabled = true;
  #   package = pkgs.postgresql_15;
  #   ensureDatabases = [
  #     "p215"
  #   ];
  #   ensureUsers = [
  #     {
  #       name = "jonny";
  #       ensurePermissions = {
  #         "DATABASE p215" = "ALL PRIVILEGES";
  #       };
  #     }
  #   ];
  # };


}
