{ config, lib, pkgs, ... }:

let

  mod = "Mod4";

in {
  # gtk = {
  #   enable = true;
  #   theme.name = "Adwaita-dark";
  #   cursorTheme = {
  #     name = "breeze";
  #     size = 24;
  #   };
  # };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "network" "memory" "disk" "pulseaudio" "battery" "clock" ];

        "sway/workspaces" = {
          all-outputs = true;
        };

        clock = {
          format = "{:%I:%M %p}";
        };

        battery = {
          states = {
              warning = 30;
              critical = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
          max-length = 25;
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% {icon}";
          "format-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "墳" ""];
          };
          "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        disk = {
          format = "{percentage_used}% ";
        };

        memory = {
          format = "{}% ";
        };

        network = {
          "format-wifi" = "直";
          "format-disconnect" = "睊";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
        };
      };
    };
  };

  home.packages = with pkgs; [
      wl-clipboard
      flameshot
      wdisplays
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = null;

    wrapperFeatures = {
      gtk = true;
      base = true;
    };

    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=sway
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export MOZ_ENABLE_WAYLAND=1
      export _JAVA_AWT_WM_NONREPARENTING=1
      export NIXOS_OZONE_WL=1
    '';

    xwayland = true;

    extraConfig = ''
      bindswitch lid:on output eDP-1 disable
      bindswitch lid:off output eDP-1 enable
    '';

    config = {
      modifier = mod;
      terminal = "${pkgs.alacritty}/bin/alacritty";

      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
      }];

      gaps = {
        inner = 5;
        outer = 5;
      };

      output = {
        # Built-in display
        "eDP-1" = {
          scale = "1.5";
        };
      };

      seat = {
        "*" = {
          xcursor_theme = "breeze";
        };
      };

      input = {
        "*" = { 
          xkb_options = "ctrl:nocaps";

          repeat_delay = "200";
          repeat_rate = "40";

          middle_emulation = "disabled";
          click_method = "clickfinger";
        };
      };

      window.titlebar = false;

      menu = "${pkgs.wofi}/bin/wofi --show run";

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

        "${mod}+w" = "sticky toggle";

        # Multiple monitor
        "${mod}+Shift+greater" = "move container to output right";
        "${mod}+Shift+less" = "move container to output left";

        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 5";
        "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 5";
        "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t";
        "XF86MonBrightnessUp" =  "exec light -A 10";
        "XF86MonBrightnessDown" = "exec light -U 10";
      };
    };
  };
}
