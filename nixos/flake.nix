{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-24.11;
  inputs.nixpkgs-20-09.url = github:NixOS/nixpkgs/nixos-20.09;
  inputs.nixpkgs-unstable.url = github:NixOS/nixpkgs/nixos-unstable;

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./config.nix
      ];
    };
  };
}
