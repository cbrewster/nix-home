{ config, lib, pkgs, ... }:

let

  github-nvim-theme = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "github-nvim-theme";
    src = pkgs.fetchFromGitHub {
      owner = "projekt0n";
      repo = "github-nvim-theme";
      rev = "b3f15193d1733cc4e9c9fe65fbfec329af4bdc2a";
      sha256 = "wLX81wgl4E50mRig9erbLyrxyGbZllFbHFAQ9+v60W4=";
    };
  };

  go-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "go-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "go.nvim";
      rev = "c75824b1f050c153ebfd5be65a318b9d4463d5a9";
      sha256 = "azO+Eay3V9aLyJyP1hmKiEAtr6Z3OqlWVu4v2GEoUdo=";
    };
  };

  prettier-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "prettier-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "prettier.nvim";
      rev = "d98e732cb73690b07c00c839c924be1d1d9ac5c2";
      sha256 = "sha256-4xq+caprcQQotvBXnWWSsMwVB2hc5uyjrhT1dPBffXI=";
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
      fidget-nvim
      null-ls-nvim

      editorconfig-nvim

      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua

      vim-vsnip
      vim-vsnip-integ
      cmp-vsnip

      vim-sleuth

      lspkind-nvim

      # luasnip
      # cmp_luasnip

      (nvim-treesitter.withAllGrammars)
      nvim-treesitter-context
      playground

      lualine-nvim
      vim-highlightedyank
      vim-matchup
      vim-surround
      vim-commentary
      vim-gitgutter
      vim-fugitive
      vim-rooter
      diffview-nvim

      vim-crates
      vim-toml
      yats-vim
      typescript-vim
      vim-jsx-typescript
      neoformat
      vim-nix
      vim-terraform
      nvim-lsp-ts-utils
      go-nvim
      vim-clang-format
      prettier-nvim

      gruvbox
      github-nvim-theme

      nvim-web-devicons

      popup-nvim
      plenary-nvim
      telescope-nvim
      telescope-ui-select-nvim

      orgmode
      octo-nvim
    ];
  };
}
