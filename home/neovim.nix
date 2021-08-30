{ config, lib, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
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
