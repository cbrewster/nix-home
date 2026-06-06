{ lib, pkgs, config, ... }:

let

  mod = "Mod4";
  gapSize = 5;

  background = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/acfd27ad83e5e279127a38ef410bcfac6d77c264/images/ign_colorful.png";
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
    settings = {
      default-timeout = 5000;
      border-radius = 5;
      margin = "5";
      font = "FiraCode Nerd Font 10";
    };
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
        position = "bottom";
        spacing = 0;
        height = 28;
        margin-left = gapSize;
        margin-right = gapSize;
        margin-bottom = gapSize;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "group/tray-expander" "group/ctl" "clock" ];

        "sway/workspaces" = {
          all-outputs = true;
        };

        clock = {
          format = "{:%I:%M %p}";
          format-alt = "{:%A  %e %B}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        battery = {
          states = {
            warning = 20;
            critical = 10;
          };
          format = "{capacity}% {icon}";
          format-discharging = "{icon} {capacity}%";
          format-charging = "{icon} {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = {
            charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
            default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          };
          format-full = "󰂅";
          tooltip-format-discharging = "{power:>1.0f}W↓ {capacity}%";
          tooltip-format-charging = "{power:>1.0f}W↑ {capacity}%";
          interval = 5;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          tooltip-format = "Playing at {volume}%";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" " " " " ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.pamixer}/bin/pamixer -t";
        };

        memory = {
          format = "󰍛 {}%";
        };

        cpu = {
          interval = 2;
          format = "󰍛 {usage}%";
        };

        network = {
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          format = "{icon}";
          format-wifi = "{icon}";
          format-ethernet = "󰀂";
          format-disconnected = "󰤮";
          tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-disconnected = "Disconnected";
          interval = 3;
          spacing = 1;
        };

        tray = {
          icon-size = 12;
          spacing = 4;
        };

        "custom/expand-icon" = {
          format = "";
          tooltip = false;
        };

        "group/tray-expander" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 600;
            children-class = "tray-group-item";
          };
          modules = [ "custom/expand-icon" "tray" ];
        };

        "group/ctl" = {
          orientation = "inherit";
          modules = [ "network" "pulseaudio" "cpu" "memory" "battery" ];
        };
      };
    };
  };

  home.packages = with pkgs; [
    brightnessctl
    wl-clipboard
    flameshot
    wdisplays
    sway-contrib.grimshot
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = null;
    extraConfig = ''
      corner_radius 10

      blur enable
      blur_xray disable
      blur_passes 3
      blur_radius 5

      layer_effects "waybar" {
        blur enable;
        blur_xray disable;
        corner_radius 13;
      }

      layer_effects "rofi" {
        blur enable;
        blur_xray disable;
        corner_radius 13;
      }
    '';

    wrapperFeatures = {
      gtk = true;
      base = true;
    };

    xwayland = true;

    config = {
      modifier = mod;
      terminal = "${config.programs.ghostty.package}/bin/ghostty";

      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
      }];

      gaps = {
        inner = gapSize;
        outer = 0;
      };

      colors = {
        focused = {
          border = "#2a2a2a99";
          background = "#2a2a2a99";
          text = "#eeeeee";
          indicator = "#e8e8e899";
          childBorder = "#e8e8e899";
        };
        focusedInactive = {
          border = "#2a2a2a66";
          background = "#2a2a2a66";
          text = "#eeeeee";
          indicator = "#e8e8e84d";
          childBorder = "#e8e8e84d";
        };
        unfocused = {
          border = "#2a2a2a66";
          background = "#2a2a2a66";
          text = "#eeeeee";
          indicator = "#e8e8e84d";
          childBorder = "#e8e8e84d";
        };
      };

      input."2362:628:PIXA3854:00_093A:0274_Touchpad" = {
        dwt = "enabled";
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

      window = {
        border = 1;
        titlebar = false;
      };

      menu = "${pkgs.rofi}/bin/rofi -show drun -theme ${./rofi.rasi} ";

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
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +10%";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";
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
