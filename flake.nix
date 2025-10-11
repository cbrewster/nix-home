{
  description = "Home Manager configuration of cbrewster";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hy3.url = "github:outfoxxed/hy3?ref=hl0.49.0";
  };

  outputs =
    { nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."cbrewster" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-fw-personal.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
