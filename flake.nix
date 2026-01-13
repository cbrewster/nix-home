{
  description = "Home Manager configuration for cbrewster";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHomeConfiguration = modules:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home.username = "cbrewster";
              home.homeDirectory = "/home/cbrewster";
            }
          ] ++ modules;
        };
    in
    {
      homeConfigurations = {
        "cbrewster@framework" = mkHomeConfiguration [ ./home-framework.nix ];
        "cbrewster@fw-personal" = mkHomeConfiguration [ ./home-fw-personal.nix ];
      };
    };
}
