{ pkgs, ... }:

let

  github-nvim-theme = pkgs.vimUtils.buildVimPlugin {
    name = "github-nvim-theme";
    src = pkgs.fetchFromGitHub {
      owner = "projekt0n";
      repo = "github-nvim-theme";
      rev = "c106c9472154d6b2c74b74565616b877ae8ed31d";
      hash = "sha256-/A4hkKTzjzeoR1SuwwklraAyI8oMkhxrwBBV9xb59PA=";
    };
  };

in

{
  home.sessionVariables.EDITOR = "nvim";

  home.packages = with pkgs; [
    elixir_ls
    nodePackages.bash-language-server
    gopls
    shellcheck
  ];

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
      none-ls-nvim

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
      go-nvim
    ]) ++ [
      github-nvim-theme
    ];
  };
}
