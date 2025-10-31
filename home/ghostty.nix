{ ... }: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      async-backend = "epoll";
      window-decoration = false;
      resize-overlay = "never";
      confirm-close-surface = false;
      theme = "GitHub Dark";
    };
  };
}
