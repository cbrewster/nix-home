{ config, lib, pkgs, ... }:

let
  customNodePackages = pkgs.callPackage ./node-packages {
      nodejs = pkgs.nodejs-14_x;
  };
in {
  imports = [
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/alacritty.nix
    ./home/git.nix
    ./home/direnv.nix
    ./home/tmux.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cbrewster";
  home.homeDirectory = "/Users/cbrewster";

  home.packages = with pkgs; [
    ripgrep
    nix-index
    kubectl
    kubectx
    htop
    jq
    nodejs-14_x
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.eslint
    nodePackages.prettier
    google-cloud-sdk
    docker-compose
    terraform

    customNodePackages."@ansible/ansible-language-server"
    customNodePackages."@withgraphite/graphite-cli"

    rust-analyzer

    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  fonts.fontconfig.enable = true;

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
