{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager }: {

	devShell.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.mkShell { };
	devShells.aarch64-darwin.default =   let pkgs = import nixpkgs { system = "aarch64-darwin"; }; in pkgs.mkShell { packages = [pkgs.python310 pkgs.python311]; };


    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        system = "aarch64-darwin"; # Set the target system to macOS M1
        modules = [
          ./configuration.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.obwoni000 = import ./nixos/home.nix; 
          }
        ];
      };




    };

	defaultPackage.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin;
    home-manager.aarch64-darwin = home-manager.makeOverlays [
        (home-manager.overlays.override {
          config = import ./nixos/home.nix;
        })
      ];

  };
}
