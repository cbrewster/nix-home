{ lib, pkgs, ... }:

let

  customNodePackages = pkgs.callPackage ../node-packages/override.nix {
    nodejs = pkgs.nodejs-18_x;
  };

in

{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    shellAliases = {
      gt = "fp";
    };

    initExtra = ''
      source <(${customNodePackages."@bradymadden97/freephite-cli"}/bin/fp completion) 
      export PATH=~/google-cloud-sdk/bin:$PATH
      export GCEVM_USERNAME=connor;
    '';

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];
  };
}
