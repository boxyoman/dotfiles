{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-26.05;
  inputs.nixpkgs-unstable.url = github:NixOS/nixpkgs/nixos-unstable;
  inputs.zen-browser.url = github:0xc000022070/zen-browser-flake;

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
