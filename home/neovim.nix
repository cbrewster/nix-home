{ config, lib, pkgs, ... }:

let

  github-nvim-theme = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "github-nvim-theme";
    src = pkgs.fetchFromGitHub {
      owner = "projekt0n";
      repo = "github-nvim-theme";
      rev = "a70f851cd5fcfff0d2c0fab062d31e4d40a71d52";
      sha256 = "1q6bhm1iiv1yk9q2i9057h1irndbydsy1fc15qsl16avg74v09hl";
    };
  };

in

{
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    package = pkgs.neovim-nightly;
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

      gruvbox
      github-nvim-theme

      nvim-web-devicons

      popup-nvim
      plenary-nvim
      telescope-nvim
    ];
  };  
}
