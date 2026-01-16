{ pkgs, ... }:

let

  tcld = pkgs.callPackage ./pkgs/tcld.nix { };

in
{
  imports = [
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/git.nix
    ./home/jj.nix
    ./home/direnv.nix
    ./home/tmux.nix
    ./home/ai.nix
  ];

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #   }))
  # ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = (with pkgs; [
    ripgrep
    nix-index
    kubectl
    kubectx
    kubernetes-helm
    htop
    jq
    clang
    clang-tools
    whois
    tree
    ffmpeg
    nixos-shell
    bloomrpc
    protonup-ng
    node2nix
    gh
    wireshark
    mosh
    brotli
    xclip
    vscode-langservers-extracted
    pyright
    basedpyright
    ruff
    zls
    btop
    tcld
    temporal-cli
    typescript-go

    natscli
    nats-server
    nsc

    rustup
    cargo-edit

    nixd
    nodePackages.prettier

    nerd-fonts.fira-code
    nerd-fonts.iosevka

    fd
  ]) ++ (with pkgs.python3Packages; [
    python-lsp-server
    python-lsp-jsonrpc
    python-lsp-black
    python-lsp-ruff
    pyls-isort
    pyls-flake8
    pylsp-mypy
    flake8
    isort
    black
  ]);

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
