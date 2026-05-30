{
  description = "Home Manager configuration for cbrewster";

  nixConfig = {
    extra-substituters = [
      "https://cache.numtide.com"
      "https://ghostty.cachix.org"
      "https://niri.cachix.org"
    ];
    extra-trusted-public-keys = [
      "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    ghostty.url = "github:ghostty-org/ghostty";
    llm-agents.url = "github:numtide/llm-agents.nix";
    jj-github = {
      url = "github:cbrewster/jj-github";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ghostty, llm-agents, jj-github, niri, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHomeConfiguration = username: modules:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit ghostty system llm-agents jj-github niri; };
          modules = [
            {
              home.username = username;
              home.homeDirectory = "/home/${username}";
            }
          ] ++ modules;
        };
    in
    {
      inherit inputs;
      homeConfigurations = {
        "cbrewster@cbrewster-framework" = mkHomeConfiguration "cbrewster" [ ./home-fw-work.nix ];
        "cbrewster@cbrewster-fw16" = mkHomeConfiguration "cbrewster" [ ./home-fw-personal.nix ];
        "developer@zergrush" = mkHomeConfiguration "developer" [ ./home-zergrush.nix ];
      };
    };
}
