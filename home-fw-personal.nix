{ pkgs, ... }:

{
  imports = [
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/alacritty.nix
    ./home/git.nix
    ./home/direnv.nix
    ./home/tmux.nix
    ./home/ghostty.nix
    ./home/sway.nix
    ./home/niri.nix
    ./home/jj.nix
    ./home/ai.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
  };

  home.packages = with pkgs; [
    ripgrep
    nix-index
    htop
    jq
    clang
    clang-tools
    llvmPackages.libclang.lib
    whois
    tree
    gitstatus
    ffmpeg
    simplescreenrecorder
    nixos-shell
    flyctl
    elixir-ls
    elixir
    insomnia
    protonup-ng
    gh
    wireshark
    xclip
    kubectx
    kubectl
    protobuf
    gnumake
    cmake
    pkg-config
    lldb
    gdbgui
    gdb
    zed-editor

    natscli
    nats-server
    nsc

    rustup
    cargo-edit

    spotify
    slack
    discord

    nixd
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.iosevka
    pkgs.inter
  ];

  wayland.windowManager.sway = {
    extraConfig = ''
      bindswitch --reload lid:on output eDP-2 disable
      bindswitch --reload lid:off output eDP-2 enable
      for_window [title="Firefox - Sharing Indicator"] kill
    '';

    config.output = {
      # Built-in display
      "eDP-2" = {
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
  home.stateVersion = "26.05";
}
