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

  jj-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "jj-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "NicolasGB";
      repo = "jj.nvim";
      rev = "463fd0876aa2e3e991d2453e24557aa956d974d9";
      hash = "sha256-N1f9Gjmbev11F7Cp60zYodY/NkZXJQreVbnsiY9mfOg=";
    };
  };

in

{
  home.sessionVariables.EDITOR = "nvim";

  home.packages = with pkgs; [
    elixir-ls
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
      fidget-nvim
      none-ls-nvim
      jj-nvim

      # Debugger
      nvim-dap
      nvim-dap-ui

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
