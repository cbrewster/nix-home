{ lib, pkgs, ... }:

let

  mod = "Mod4";

  background = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/acfd27ad750277053e4bb6784547a634ce2cc264/images/ign_colorful.png";
    hash = "sha256-Rows/HKVlAdjlGz/LrRWKqOTYNO11YJ0UPFYVgpCOnI=";
  };

in
{
  xsession.enable = true;
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    font = "FiraCode Nerd Font 10";
    borderRadius = 5;
    margin = "5";
  };

  # services.swayidle = {
  #   enable = true;
  #   events = [
  #     { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
  #     { event = "lock"; command = "lock"; }
  #   ];
  #   timeouts = [
  #     { timeout = 900; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
  #     { timeout = 1200; command = "${pkgs.systemd}/bin/systemctl suspend"; }
  #   ];
  # };

  programs.swaylock = {
    enable = true;
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
          format-charging = "{capacity}% {icon}  󰂄";
          format-icons = [ "" "" "" "" "" ];
          max-length = 25;
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% ";
          "format-muted" = "󰖁";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        disk = {
          format = "{percentage_used}% 󱛟";
        };

        memory = {
          format = "{}% 󰍛";
        };

        network = {
          "format-wifi" = "󰖩";
          "format-disconnect" = "󱚵";
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

    config = {
      modifier = mod;
      terminal = "${pkgs.ghostty}/bin/ghostty";

      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
      }];

      gaps = {
        inner = 5;
        outer = 5;
      };

      input."2362:628:PIXA3854:00_093A:0274_Touchpad" = {
        dwt = "enabled";
        tap = "enabled";
        middle_emulation = "enabled";
      };

      output = {
        "LG Electronics LG ULTRAGEAR 106MXVWAG815" = {
          pos = "0 0";
          mode = "2560x1440@144Hz";
        };
        "LG Electronics LG ULTRAGEAR 011NTQD9H748" = {
          pos = "2560 0";
          mode = "2560x1440@144Hz";
        };
        "*" = {
          # background = "${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src} stretch #303440";
          background = "${background} fill #303440";
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

        "Ctrl+Shift+4" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";

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
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };
}
