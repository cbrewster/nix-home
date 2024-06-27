{ pkgs, ... }:

let

  customNodePackages = pkgs.callPackage ./node-packages/override.nix {
    nodejs = pkgs.nodejs-18_x;
  };

in
{
  imports = [
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/alacritty.nix
    ./home/git.nix
    ./home/direnv.nix
    ./home/tmux.nix
    ./home/sway.nix
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

  home.packages = (with pkgs; [
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
    gitstatus
    ffmpeg
    simplescreenrecorder
    nixos-shell
    flyctl
    elixir
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
    vscode-langservers-extracted
    pyright
    ruff
    ruff-lsp

    vagrant
    ansible
    firecracker
    natscli
    nats-server
    nsc

    rustup
    cargo-edit

    # unfree :(
    # (pkgs.writeShellScriptBin "1password" ''
    #   exec ${pkgs._1password-gui}/bin/1password --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    # # '')
    # (pkgs.writeShellScriptBin "discord" ''
    #   exec ${pkgs.discord-canary}/bin/discordcanary --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    # '')
    # (pkgs.writeShellScriptBin "postman" ''
    #   exec ${pkgs.postman}/bin/postman --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland
    # '')
    zoom-us
    spotify
    slack
    discord

    nixd

    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
  ]) ++ [
    customNodePackages."@ansible/ansible-language-server"
    customNodePackages."@bradymadden97/freephite-cli"
    customNodePackages."@devcontainers/cli"
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode-remote.remote-ssh
    ];
  };

  wayland.windowManager.sway = {
    extraConfig = ''
      bindswitch lid:on output eDP-1 disable
      bindswitch lid:off output eDP-1 enable
      for_window [title="Firefox - Sharing Indicator"] kill
    '';

    config.output = {
      # Built-in display
      "eDP-1" = {
        scale = "1.25";
      };
    };
  };

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
