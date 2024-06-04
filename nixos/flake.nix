{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-24.05;
  inputs.nixpkgs-20-09.url = github:NixOS/nixpkgs/nixos-20.09;
  inputs.nixpkgs-unstable.url = github:NixOS/nixpkgs/nixos-unstable;
  inputs.home-manager.url = github:nix-community/home-manager;

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./config.nix ];
    };
  };
}
