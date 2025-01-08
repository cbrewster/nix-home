{ ... }: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      window-decoration = false;
      resize-overlay = "never";
      confirm-close-surface = false;
      theme = "GitHub Dark";
    };
  };
}
