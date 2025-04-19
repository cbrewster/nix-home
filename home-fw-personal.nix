{ pkgs, ... }:

{
  imports = [
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/alacritty.nix
    ./home/git.nix
    ./home/direnv.nix
    ./home/tmux.nix
    ./home/sway.nix
    ./home/ghostty.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cbrewster";
  home.homeDirectory = "/home/cbrewster";

  home.packages = with pkgs; [
    ripgrep
    nix-index
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
    elixir_ls
    elixir
    insomnia
    protonup-ng
    node2nix
    gh
    wireshark
    xclip
    zls
    kubectx
    kubectl

    natscli
    nats-server
    nsc

    rustup
    cargo-edit

    (writeShellScriptBin "spotify" ''
      exec ${lib.getExe spotifywm} --enable-features=UseOzonePlatform --ozone-platform=wayland    '')
    slack
    discord

    nixd
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.iosevka
  ];

  wayland.windowManager.sway = {
    extraConfig = ''
      bindswitch lid:on output eDP-2 disable
      bindswitch lid:off output eDP-2 enable
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
  home.stateVersion = "21.05";
}
