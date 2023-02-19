{ config, lib, pkgs, ... }:

let

  mod = "Mod4";

in {
  programs.rofi = {
    enable = true;
    theme = ./rofi.rasi;
  };

  xsession.windowManager.i3 = {
    enable = true;

    extraConfig = ''
      for_window [title="Desktop — Plasma"] kill, floating enable, border none
      for_window [class="plasmashell"] floating enable
      for_window [class="Plasma"] floating enable, border none
      for_window [title="plasma-desktop"] floating enable, border none
      for_window [title="win7"] floating enable, border none
      for_window [class="krunner"] floating enable, border none
      for_window [class="Kmix"] floating enable, border none
      for_window [class="Klipper"] floating enable, border none
      for_window [class="Plasmoidviewer"] floating enable, border none
      for_window [class="(?i)*nextcloud*"] floating disable
      for_window [class="plasmashell" window_type="notification"] floating enable, border none, move right 700px, move down 450px
      for_window [title="kscreen_osd_service"] floating enable
      no_focus [class="plasmashell" window_type="notification"] 
    '';

    config = {
      modifier = mod;
      terminal = "${pkgs.alacritty}/bin/alacritty";

      startup = [
        { command = "xset r rate 200 40"; }
        {
          command = "${pkgs.feh}/bin/feh --bg-center ~/.wallpaper.jpg";
          always = true;
          notification = false;
        }
      ];

      gaps = {
        inner = 5;
        outer = 0;
      };

      window.titlebar = false;

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show run";
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

        "${mod}+w" = "sticky toggle";

        "${mod}+Shift+e" = "exec qdbus org.kde.ksmserver /KSMServer logout 1 3 3";

        # Multiple monitor
        "${mod}+shift+greater" = "move workspace to output right";
        "${mod}+shift+less" = "move workspace to output left";

        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 5";
        "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 5";
        "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t";
      };

      bars = [];
    };
  };

  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    config = ./polybar.ini;
    script = ''
      for m in $(${pkgs.xorg.xrandr}/bin/xrandr --query | ${pkgs.gnugrep}/bin/grep " connected" | ${pkgs.coreutils}/bin/cut -d" " -f1); do
        echo starting $MONITOR
        MONITOR=$m polybar --reload primary &
      done
    '';
  };

  # Polybar is wanted by tray.target which doesn't exist.
  systemd.user.services.polybar = {
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
