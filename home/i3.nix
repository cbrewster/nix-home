{ config, lib, pkgs, ... }:

let

  mod = "Mod4";

in {
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      terminal = "${pkgs.alacritty}/bin/alacritty";

      startup = [
        { command = "xset r rate 200 40"; }
      ];

      gaps = {
        inner = 10;
        outer = 10;
      };

      window.titlebar = false;

      keybindings = lib.mkOptionDefault {
        # Focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # Move
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+v" = "split h";
        "${mod}+s" = "split v";

        "${mod}+Shift+e" = "exec ${pkgs.xfce.xfce4-session}/bin/xfce4-session-logout";

        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
      };

      bars = [
          {
            position = "bottom";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status-rust.toml}";
            colors = {
              background = "#06060f";
              statusline = "#ffffff";
              separator = "#666666";
              focusedWorkspace = {
                border = "#3A1C47";
                background = "#4D265E";
                text = "#ffffff";
              };
              activeWorkspace = {
                border = "#3A1C47";
                background = "#292B37";
                text = "#ffffff";
              };
              inactiveWorkspace = {
                border = "#333333";
                background = "#222222";
                text = "#D3D3D3";
              };
              urgentWorkspace = {
                border = "#2f343a";
                background = "#BF2E2E";
                text = "#ffffff";
              };
              bindingMode = {
                border = "#2f343a";
                background = "#BF2E2E";
                text = "#ffffff";
              };
            };
          }
      ];
    };
  };
}
