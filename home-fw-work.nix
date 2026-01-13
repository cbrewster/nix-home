{ pkgs, ... }:

let

  customNodePackages = pkgs.callPackage ./node-packages/override.nix { nodejs = pkgs.nodejs; };
  tcld = pkgs.callPackage ./pkgs/tcld.nix { };

in
{
  imports = [
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/alacritty.nix
    ./home/git.nix
    ./home/jj.nix
    ./home/direnv.nix
    ./home/tmux.nix
    ./home/sway.nix
    ./home/ghostty.nix
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
    ffmpeg
    simplescreenrecorder
    nixos-shell
    flyctl
    elixir
    via
    chromium
    firefox
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

  wayland.windowManager.sway = {
    extraConfig = ''
      bindswitch lid:on output eDP-1 disable
      bindswitch lid:off output eDP-1 enable
      for_window [title="Firefox - Sharing Indicator"] kill
    '';

    config.output = {
      # Built-in display
      "eDP-1" = {
        scale = "1.5";
      };
      # External monitors (work)
      "ASUSTek COMPUTER INC VG28UQL1A RALMTF013823" = {
        scale = "1.5";
      };
      "Dell Inc. DELL U3219Q DJFL413" = {
        pos = "-3840 0";
        scale = "1.5";
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
