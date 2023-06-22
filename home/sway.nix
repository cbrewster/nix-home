{ config, lib, pkgs, ... }:

let

  mod = "Mod4";

in
{
  xsession.enable = true;
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 24;
  };

  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    font = "FiraCode Nerd Font 10";
    borderRadius = 5;
    margin = "5";
  };

  programs.waybar = {
    enable = true;
    style = ./waybar.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "tray" "network" "memory" "disk" "pulseaudio" "battery" "clock" ];

        "sway/workspaces" = {
          all-outputs = true;
        };

        clock = {
          format = "{:%I:%M %p}";
        };

        battery = {
          states = {
            warning = 10;
            critical = 5;
          };
          format = "{capacity}% {icon} ";
          format-charging = "{capacity}% {icon}  ";
          format-icons = [ "" "" "" "" "" ];
          max-length = 25;
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% ";
          "format-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "墳" "" ];
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
    sway-contrib.grimshot
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = null;

    wrapperFeatures = {
      gtk = true;
      base = true;
    };

    xwayland = true;

    extraConfig = ''
      bindswitch lid:on output eDP-1 disable
      bindswitch lid:off output eDP-1 enable
      for_window [title="Firefox - Sharing Indicator"] kill
    '';

    config = {
      modifier = mod;
      terminal = "${pkgs.alacritty}/bin/alacritty";

      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
      }];

      gaps = {
        inner = 5;
        outer = 0;
      };

      output = {
        # Built-in display
        "eDP-1" = {
          scale = "1.25";
        };
        "eDP-1" = { };
        "Goldstar Company Ltd LG ULTRAGEAR 106MXVWAG815" = {
          pos = "0 0";
        };
        "Goldstar Company Ltd LG ULTRAGEAR 011NTQD9H748" = {
          pos = "2560 0";
        };
        "*" = {
          background = "~/.wallpaper.jpg center #303440";
        };
      };

      seat = {
        seat0 = {
          xcursor_theme = "Adwaita 24";
        };
      };

      input = {
        "*" = {
          xkb_options = "ctrl:nocaps";

          repeat_delay = "200";
          repeat_rate = "40";

          middle_emulation = "disabled";
          click_method = "clickfinger";
          dwt = "disabled";
        };
      };

      window.titlebar = false;

      menu = "${pkgs.wofi}/bin/wofi --style=${./wofi.css} --show run";

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
        "${mod}+greater" = "move workspace to output right";
        "${mod}+less" = "move workspace to output left";

        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 5";
        "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 5";
        "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t";
        "XF86MonBrightnessUp" = "exec light -A 10";
        "XF86MonBrightnessDown" = "exec light -U 10";
        "Print" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy";
      };
    };
  };
}
