{ config, lib, pkgs, ... }:

let

  popup-nvim-latest = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "popup-nvim";
    version = "2021-05-10";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "popup.nvim";
      rev = "5e3bece7b4b4905f4ec89bee74c09cfd8172a16a";
      sha256 = "1k6rz652fjkzhjd8ljr0l6vfispanrlpq0r4aya4qswzxni4rxhg";
    };
  };

  plenary-nvim-latest = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "plenary-nvim";
    version = "2021-05-10";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "3f993308024697186c02d51df1330bf07c12535a";
      sha256 = "0riw3wy94qhbdvx32nmlc1s85n3ykg64n45p7i7mii0cd17mqm27";
    };
  };

  telescope-nvim-latest = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-nvim";
    version = "2021-05-10";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "c061c216bfe082384d542a487ce02e9aed6177df";
      sha256 = "1x4mhxwp9crs63a43wlph4jbl92192sl3hiwchwlim0g1wdar0ky";
    };
  };

in

  {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    vimAlias = true;

    extraConfig = (builtins.readFile ./init.vim);
      
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-compe
      lspsaga-nvim
      vim-vsnip
      vim-vsnip-integ
      lsp-status-nvim

      nvim-treesitter

      galaxyline-nvim
      vim-highlightedyank
      vim-matchup
      vim-surround
      vim-commentary
      vim-gitgutter
      vim-fugitive
      vim-rooter

      vim-crates
      vim-toml
      yats-vim
      typescript-vim
      vim-jsx-typescript
      neoformat
      vim-nix        

      gruvbox

      nvim-web-devicons

      popup-nvim-latest
      plenary-nvim-latest
      telescope-nvim-latest
    ];
  };  
}
