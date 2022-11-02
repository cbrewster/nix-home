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
    ./home/sway.nix 
    # ./home/backgrounds.nix
    ./home/direnv.nix
    ./home/tmux.nix
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
    (pkgs.writeShellScriptBin "insomnia" ''
      exec ${pkgs.insomnia}/bin/insomnia --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    '')

    vagrant
    ansible

    rustup
    rust-analyzer
    cargo-edit

    customNodePackages."@ansible/ansible-language-server"
    customNodePackages."@withgraphite/graphite-cli"

    # unfree :(
    (pkgs.writeShellScriptBin "1password" ''
      exec ${pkgs._1password-gui}/bin/1password --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    '')
    (pkgs.writeShellScriptBin "discord" ''
      exec ${pkgs.discord-canary}/bin/discordcanary --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    '')
    zoom-us
    spotify

    (nerdfonts.override { fonts = [ "FiraCode" ]; })
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
