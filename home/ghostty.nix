{ ghostty, system, ... }: {
  programs.ghostty = {
    enable = true;
    package = ghostty.packages.${system}.default;
    enableZshIntegration = true;
    settings = {
      async-backend = "epoll";
      window-decoration = false;
      resize-overlay = "never";
      confirm-close-surface = false;
      theme = "GitHub Dark";
      shell-integration-features = "ssh-terminfo,ssh-env";
    };
  };
}
