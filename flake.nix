{
  description = "Home Manager configuration for cbrewster";

  nixConfig = {
    extra-substituters = [
      "https://cache.numtide.com"
      "https://ghostty.cachix.org"
    ];
    extra-trusted-public-keys = [
      "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    ghostty.url = "github:ghostty-org/ghostty";
    llm-agents.url = "github:numtide/llm-agents.nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ghostty, llm-agents, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHomeConfiguration = modules:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit ghostty system llm-agents; };
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
        "cbrewster@cbrewster-framework" = mkHomeConfiguration [ ./home-fw-work.nix ];
        "cbrewster@fw-personal" = mkHomeConfiguration [ ./home-fw-personal.nix ];
      };
    };
}
