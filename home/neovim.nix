{ config, lib, pkgs, ... }:

let

  github-nvim-theme = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "github-nvim-theme";
    src = pkgs.fetchFromGitHub {
      owner = "projekt0n";
      repo = "github-nvim-theme";
      rev = "eeac2e7b2832d8de9a21cfa8627835304c96bb44";
      sha256 = "tZBS+eP7n98WVvM2EZdPSttGAjUniXP+rEoQn4aL3eU=";
    };
  };

in

{
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    # package = pkgs.neovim-nightly;
    enable = true;
    vimAlias = true;

    extraConfig = (builtins.readFile ./init.vim);
      
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      # lspsaga-nvim
      lsp-status-nvim

      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      
      vim-vsnip
      vim-vsnip-integ
      cmp-vsnip

      lspkind-nvim

      # luasnip
      # cmp_luasnip

      nvim-treesitter
      playground

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
      vim-terraform
      nvim-lsp-ts-utils

      gruvbox
      github-nvim-theme

      nvim-web-devicons

      popup-nvim
      plenary-nvim
      telescope-nvim
      telescope-ui-select-nvim

      orgmode
    ];
  };  
}
