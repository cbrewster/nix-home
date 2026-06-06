{ pkgs, system, hunk, ... }:

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
    hunk.homeManagerModules.default
  ];

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #   }))
  # ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.hunk = {
    enable = true;
    package = hunk.packages.${system}.default.overrideAttrs (old: {
      patches = (old.patches or []) ++ [
        ./home/hunk-github-dark-dimmed.patch
      ];
    });
    settings = {
      theme = "custom";
      custom_theme = {
        base = "graphite";
        label = "GitHub Dark Dimmed";

        background = "#22272e";
        panel = "#1e232a";
        panelAlt = "#292e36";
        border = "#444c56";
        accent = "#539bf5";
        accentMuted = "#2b4f81";
        text = "#adbac7";
        muted = "#768390";

        addedBg = "#253430";
        removedBg = "#3b2a2f";
        contextBg = "#22272e";
        addedContentBg = "#275736";
        removedContentBg = "#783839";
        contextContentBg = "#22272e";
        addedSignColor = "#57ab5a";
        removedSignColor = "#e5534b";
        lineNumberBg = "#22272e";
        lineNumberFg = "#636e7b";
        selectedHunk = "#36557e";

        badgeAdded = "#57ab5a";
        badgeRemoved = "#e5534b";
        badgeNeutral = "#636e7b";
        fileNew = "#57ab5a";
        fileDeleted = "#e5534b";
        fileRenamed = "#c69026";
        fileModified = "#cc6b2c";
        fileUntracked = "#539bf5";

        noteBorder = "#b083f0";
        noteBackground = "#35324c";
        noteTitleBackground = "#56457e";
        noteTitleText = "#dcbdfb";

        syntax = {
          default = "#adbac7";
          keyword = "#f47067";
          string = "#96d0ff";
          comment = "#768390";
          number = "#6cb6ff";
          function = "#dcbdfb";
          property = "#6cb6ff";
          type = "#f69d50";
          punctuation = "#adbac7";
        };
      };
    };
  };

  home.packages = (with pkgs; [
    yalc
    ripgrep
    nix-index
    kubectl
    kubectx
    stern
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
    vtsls
    zed-editor
    snouty
    python3

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
    prettier

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
      corner_radius 10

      blur enable
      blur_xray disable
      blur_passes 3
      blur_radius 5

      layer_effects "waybar" {
        blur enable;
        blur_xray disable;
        corner_radius 13;
      }

      layer_effects "rofi" {
        blur enable;
        blur_xray disable;
        corner_radius 13;
      }

      bindswitch --reload lid:on output eDP-1 disable
      bindswitch --reload lid:off output eDP-1 enable
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
      "Dell Inc. DELL P3425WE BL59R84" = {
        mode = "3440x1440@100Hz";
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
  home.stateVersion = "26.05";
}
