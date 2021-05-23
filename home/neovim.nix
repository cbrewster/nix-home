{ config, lib, pkgs, ... }:

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

      lualine-nvim
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

      popup-nvim
      plenary-nvim
      telescope-nvim
    ];
  };  
}
