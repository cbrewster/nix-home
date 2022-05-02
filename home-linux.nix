{ config, lib, pkgs, ... }:

let

  # TODO: Pull this from GitHub or something...
  # graphite = pkgs.callPackage /home/cbrewster/Development/graphite-cli {};

  customNodePackages = pkgs.callPackage ./node-packages {
      nodejs = pkgs.nodejs-12_x;
  };

in {
  imports = [
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/alacritty.nix
    ./home/git.nix
    ./home/i3.nix 
    ./home/backgrounds.nix
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
  home.homeDirectory = "/home/cbrewster";

  home.packages = with pkgs; [
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
    vscode
    gitstatus
    insomnia
    ffmpeg
    slack
    simplescreenrecorder
    nixos-shell
    wireshark
    vault

    rustup
    rust-analyzer
    cargo-edit

    customNodePackages."@ansible/ansible-language-server"
    customNodePackages."@withgraphite/graphite-cli"

    # unfree :(
    _1password
    _1password-gui
    discord
    zoom-us
    spotify
  ];

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
