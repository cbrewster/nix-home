{ pkgs, config, niri, ... }:

let
  background = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/acfd27ad83e5e279127a38ef410bcfac6d77c264/images/ign_colorful.png";
    hash = "sha256-Rows/HKVlAdjlGz/LrRWKqOTYNO11YJ0UPFYVgpCOnI=";
  };

  niriWaybarConfig = pkgs.writeTextFile {
    name = "waybar-niri-config.jsonc";
    text = builtins.toJSON {
      layer = "top";
      position = "bottom";
      height = 20;
      "modules-left" = [ "niri/workspaces" ];
      "modules-center" = [ "niri/window" ];
      "modules-right" = [ "tray" "network" "memory" "cpu" "disk" "pulseaudio" "battery" "clock" ];

      "niri/workspaces" = {
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
        "format-charging" = "{capacity}% {icon}  󰂄";
        "format-icons" = [ "" "" "" "" "" ];
        "max-length" = 25;
      };

      pulseaudio = {
        format = "{volume}% {icon}";
        "format-bluetooth" = "{volume}% ";
        "format-muted" = "󰖁";
        "format-icons" = {
          headphone = "";
          "hands-free" = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          "default" = [ "" "" "" ];
        };
        "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol";
      };

      disk = {
        format = "{percentage_used}% 󱛟";
      };

      memory = {
        format = "{}% ";
      };

      cpu = {
        format = "{usage}% 󰍛";
      };

      network = {
        "format-wifi" = "󰖩";
        "format-disconnect" = "󱚵";
        "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
      };
    };
  };
in
{
  imports = [ niri.homeModules.niri ];

  nixpkgs.overlays = [ niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
      };

      input = {
        keyboard = {
          xkb.options = "ctrl:nocaps";
          repeat-delay = 200;
          repeat-rate = 40;
        };

        touchpad = {
          tap = false;
          dwt = true;
          click-method = "clickfinger";
          middle-emulation = false;
          natural-scroll = false;
        };

        focus-follows-mouse.enable = true;
      };

      outputs."eDP-2" = {
        scale = 1.25;
      };

      layout = {
        gaps = 16;

        focus-ring = {
          enable = true;
          width = 1;
          active.color = "#2a2a2a99";
          inactive.color = "#2a2a2a66";
        };

        border = {
          enable = true;
          width = 1;
          active.color = "#e8e8e899";
          inactive.color = "#e8e8e84d";
        };

        shadow = {
          enable = true;
          offset = {
            x = 0;
            y = 6;
          };
          softness = 24;
          spread = -8;
          color = "#00000040";
          inactive-color = "#00000024";
        };
      };

      window-rules = [
        {
          geometry-corner-radius = let r = 8.0; in {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };
          clip-to-geometry = true;
        }
        {
          matches = [
            { is-active = false; }
          ];
          opacity = 0.92;
        }
      ];

      screenshot-path = null;

      hotkey-overlay.skip-at-startup = true;

      spawn-at-startup = [
        { command = [ "${pkgs.waybar}/bin/waybar" "--config" "${niriWaybarConfig}" ]; }
        { command = [ "${pkgs.swaybg}/bin/swaybg" "-m" "fill" "-c" "#303440" "-i" "${background}" ]; }
      ];

      binds = {
        # Focus (vim hjkl)
        "Super+h".action.focus-column-left = {};
        "Super+j".action.focus-window-down = {};
        "Super+k".action.focus-window-up = {};
        "Super+l".action.focus-column-right = {};

        # Move (vim hjkl)
        "Super+Shift+h".action.move-column-left = {};
        "Super+Shift+j".action.move-window-down = {};
        "Super+Shift+k".action.move-window-up = {};
        "Super+Shift+l".action.move-column-right = {};

        # Terminal
        "Super+Return".action.spawn = [ "${config.programs.ghostty.package}/bin/ghostty" ];

        # App launcher
        "Super+d".action.spawn = [ "${pkgs.wofi}/bin/wofi" "--style=${./wofi.css}" "--show" "run" ];

        # Close window
        "Super+Shift+q".action.close-window = {};

        # Exit niri
        "Super+Shift+e".action.quit = {};

        # Window sizing
        "Super+r".action.switch-preset-column-width = {};
        "Super+Shift+r".action.switch-preset-window-height = {};
        "Super+f".action.maximize-column = {};
        "Super+Shift+f".action.fullscreen-window = {};
        "Super+c".action.center-column = {};
        "Super+minus".action.set-column-width = "-10%";
        "Super+equal".action.set-column-width = "+10%";
        "Super+Shift+minus".action.set-window-height = "-10%";
        "Super+Shift+equal".action.set-window-height = "+10%";

        # Workspaces
        "Super+1".action.focus-workspace = 1;
        "Super+2".action.focus-workspace = 2;
        "Super+3".action.focus-workspace = 3;
        "Super+4".action.focus-workspace = 4;
        "Super+5".action.focus-workspace = 5;
        "Super+6".action.focus-workspace = 6;
        "Super+7".action.focus-workspace = 7;
        "Super+8".action.focus-workspace = 8;
        "Super+9".action.focus-workspace = 9;
        "Super+Shift+1".action.move-column-to-workspace = 1;
        "Super+Shift+2".action.move-column-to-workspace = 2;
        "Super+Shift+3".action.move-column-to-workspace = 3;
        "Super+Shift+4".action.move-column-to-workspace = 4;
        "Super+Shift+5".action.move-column-to-workspace = 5;
        "Super+Shift+6".action.move-column-to-workspace = 6;
        "Super+Shift+7".action.move-column-to-workspace = 7;
        "Super+Shift+8".action.move-column-to-workspace = 8;
        "Super+Shift+9".action.move-column-to-workspace = 9;
        "Super+Tab".action.focus-workspace-down = {};
        "Super+Shift+Tab".action.focus-workspace-up = {};

        # Consume/expel windows (add/remove from column)
        "Super+comma".action.consume-window-into-column = {};
        "Super+period".action.expel-window-from-column = {};

        # Media controls (work when locked)
        "XF86AudioPlay" = {
          allow-when-locked = true;
          action.spawn = [ "${pkgs.playerctl}/bin/playerctl" "play-pause" ];
        };
        "XF86AudioNext" = {
          allow-when-locked = true;
          action.spawn = [ "${pkgs.playerctl}/bin/playerctl" "next" ];
        };
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action.spawn = [ "${pkgs.playerctl}/bin/playerctl" "previous" ];
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action.spawn = [ "${pkgs.pamixer}/bin/pamixer" "-d" "5" ];
        };
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action.spawn = [ "${pkgs.pamixer}/bin/pamixer" "-i" "5" ];
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action.spawn = [ "${pkgs.pamixer}/bin/pamixer" "-t" ];
        };

        # Brightness
        "XF86MonBrightnessUp".action.spawn = [ "light" "-A" "10" ];
        "XF86MonBrightnessDown".action.spawn = [ "light" "-U" "10" ];

        # Screenshots (clipboard only)
        "Print".action.screenshot-screen = {};
        "Ctrl+Shift+4".action.screenshot = {};
      };
    };
  };

  home.packages = with pkgs; [
    swaybg
    xwayland-satellite
  ];
}
