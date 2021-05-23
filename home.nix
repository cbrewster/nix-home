{ config, lib, pkgs, ... }:

{
  imports = [
    ./home/i3.nix 
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/alacritty.nix
    ./home/git.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cbrewster";
  home.homeDirectory = "/home/cbrewster";

  services.random-background = {
    enable = true;
    imageDirectory = "%h/backgrounds";
  };

  home.packages = with pkgs; [
    brave # ugh
    nix-index
    ripgrep
    clang
    clang-tools
    htop
    kubectl
    kubectx
    minikube
    jq
    whois

    # unfree :(
    _1password
    _1password-gui
    discord
    zoom-us
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableNixDirenvIntegration = true;
  };

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
