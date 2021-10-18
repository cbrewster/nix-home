{ config, lib, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    vimAlias = true;

    extraConfig = (builtins.readFile ./init.vim);
      
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      lspsaga-nvim
      lsp-status-nvim

      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      
      vim-vsnip
      vim-vsnip-integ
      cmp-vsnip

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

      gruvbox

      nvim-web-devicons

      popup-nvim
      plenary-nvim
      telescope-nvim
    ];
  };  
}
