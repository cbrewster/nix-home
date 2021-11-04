{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    escapeTime = 0;

    prefix = "C-a";

    extraConfig = ''
      set -g mouse on
      set-option -g status-position bottom

      bind v split-window -h
      bind s split-window -v
      unbind '"'
      unbind %

      # vim like pane nav
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Alacritty color fixes
      set -g default-terminal 'screen-256color'
      set -ga terminal-overrides ',*256col*:Tc'
    '';

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10' # minutes
        '';
      }
      # {
      #   plugin = tmuxPlugins.gruvbox;
      # }
    ];
  };
}
