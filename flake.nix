{
  description = "Home Manager configuration for cbrewster";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ghostty, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHomeConfiguration = modules:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit ghostty system; };
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
        "cbrewster@fw-work" = mkHomeConfiguration [ ./home-fw-work.nix ];
        "cbrewster@fw-personal" = mkHomeConfiguration [ ./home-fw-personal.nix ];
      };
    };
}
