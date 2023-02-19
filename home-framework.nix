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
    ./home/i3.nix 
    ./home/direnv.nix
    ./home/tmux.nix
    ./home/picom.nix
  ];

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #   }))
  # ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cbrewster";
  home.homeDirectory = "/home/cbrewster";

  home.packages = with pkgs; [
    nodePackages.yalc
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
    ffmpeg
    slack
    simplescreenrecorder
    nixos-shell
    vault
    flyctl
    elixir_ls
    elixir
    rnix-lsp
    via
    chromium
    insomnia
    bloomrpc
    protonup-ng
    node2nix
    gh
    wireshark
    mosh
    brotli
    xclip

    vagrant
    ansible
    firecracker
    natscli
    nats-server

    rustup
    rust-analyzer
    cargo-edit

    customNodePackages."@ansible/ansible-language-server"
    customNodePackages."@withgraphite/graphite-cli"

    # unfree :(
    # (pkgs.writeShellScriptBin "1password" ''
    #   exec ${pkgs._1password-gui}/bin/1password --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    # '')
    # (pkgs.writeShellScriptBin "discord" ''
    #   exec ${pkgs.discord-canary}/bin/discordcanary --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    # '')
    # (pkgs.writeShellScriptBin "postman" ''
    #   exec ${pkgs.postman}/bin/postman --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    # '')
    postman
    discord
    zoom-us
    spotify

    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
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
