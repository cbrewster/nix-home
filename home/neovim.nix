{ pkgs, ... }:

let

  github-nvim-theme = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "github-nvim-theme";
    src = pkgs.fetchFromGitHub {
      owner = "projekt0n";
      repo = "github-nvim-theme";
      rev = "d832925e77cef27b16011a8dfd8835f49bdcd055";
      hash = "sha256-vsIr3UrnajxixDo0cp+6GoQfmO0KDkPX8jw1e0fPHo4=";
    };
  };

  go-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "go-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "go.nvim";
      rev = "c75824b1f050c153ebfd5be65a318b9d4463d5a9";
      hash = "sha256-azO+Eay3V9aLyJyP1hmKiEAtr6Z3OqlWVu4v2GEoUdo=";
    };
  };

  prettier-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "prettier-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "prettier.nvim";
      rev = "d98e732cb73690b07c00c839c924be1d1d9ac5c2";
      hash = "sha256-4xq+caprcQQotvBXnWWSsMwVB2hc5uyjrhT1dPBffXI=";
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

    plugins = (with pkgs.vimPlugins; [
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
      vim-rhubarb
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
      vim-clang-format
      elixir-tools-nvim

      gruvbox

      nvim-web-devicons

      popup-nvim
      plenary-nvim
      telescope-nvim
      telescope-ui-select-nvim

      orgmode
      octo-nvim
    ]) ++ [
      go-nvim
      prettier-nvim
      github-nvim-theme
    ];
  };
}
