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
      spacing = 0;
      height = 28;
      margin-left = 8;
      margin-right = 8;
      margin-bottom = 8;
      "reload-style-on-change" = true;
      "modules-left" = [ "niri/workspaces" "mpris" ];
      "modules-center" = [ "niri/window" ];
      "modules-right" = [ "group/tray-expander" "group/ctl" "clock" ];

      "niri/workspaces" = {
        all-outputs = true;
        format = "{icon}";
        "format-icons" = {
          active = "";
          default = "";
        };
      };

      clock = {
        format = " {:%I:%M %p}";
        "format-alt" = "{:%A  %e %B}";
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      battery = {
        states = {
          warning = 20;
          critical = 10;
        };
        format = "{capacity}% {icon}";
        "format-discharging" = "{icon} {capacity}%";
        "format-charging" = "{icon} {capacity}%";
        "format-plugged" = " {capacity}%";
        "format-icons" = {
          charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };
        "format-full" = "󰂅";
        "tooltip-format-discharging" = "{power:>1.0f}W↓ {capacity}%";
        "tooltip-format-charging" = "{power:>1.0f}W↑ {capacity}%";
        interval = 5;
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        "format-muted" = "󰖁";
        "tooltip-format" = "Playing at {volume}%";
        "scroll-step" = 5;
        "format-icons" = {
          headphone = "";
          "hands-free" = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          "default" = [ "" " " " " ];
        };
        "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol";
        "on-click-right" = "${pkgs.pamixer}/bin/pamixer -t";
      };

      disk = {
        format = "󱛟 {percentage_used}%";
      };

      memory = {
        format = "󰍛 {}%";
      };

      cpu = {
        interval = 2;
        format = "󰍛 {usage}%";
      };

      network = {
        "format-icons" = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        format = "{icon}";
        "format-wifi" = "{icon}";
        "format-ethernet" = "󰀂";
        "format-disconnected" = "󰤮";
        "tooltip-format-wifi" = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        "tooltip-format-ethernet" = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        "tooltip-format-disconnected" = "Disconnected";
        interval = 3;
        spacing = 1;
      };

      tray = {
        "icon-size" = 12;
        spacing = 4;
      };

      "custom/expand-icon" = {
        format = "";
        tooltip = false;
      };

      "group/tray-expander" = {
        orientation = "inherit";
        drawer = {
          "transition-duration" = 600;
          "children-class" = "tray-group-item";
        };
        modules = [ "custom/expand-icon" "tray" ];
      };

      "group/ctl" = {
        orientation = "inherit";
        modules = [ "network" "pulseaudio" "cpu" "memory" "battery" ];
      };

      mpris = {
        interval = 10;
        format = "{player_icon} {dynamic}";
        "format-paused" = "{status_icon} {artist} {title}";
        "on-click-middle" = "${pkgs.playerctl}/bin/playerctl play-pause";
        "on-click" = "${pkgs.playerctl}/bin/playerctl previous";
        "on-click-right" = "${pkgs.playerctl}/bin/playerctl next";
        "player-icons" = {
          chromium = "";
          default = "";
          firefox = "";
          mpv = "󰐹";
          spotify = "󰎆";
          vlc = "󰕼";
        };
        "status-icons" = {
          paused = "";
          playing = "";
          stopped = "";
        };
        "dynamic-order" = [ "artist" "title" ];
        "ignored-players" = [ "firefox" "zen" ];
        "max-length" = 40;
      };

      "niri/window" = {
        format = "{title}";
        "max-length" = 45;
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
        gaps = 8;

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
          geometry-corner-radius = let r = 13.0; in {
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
        { command = [ "${pkgs.waybar}/bin/waybar" "--config" "${niriWaybarConfig}" "--style" "${./waybar.css}" ]; }
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

        # Reload config and status bar
        "Super+Shift+c".action.spawn = [
          "sh"
          "-c"
          "${pkgs.niri}/bin/niri msg action load-config-file && ${pkgs.procps}/bin/pkill waybar; ${pkgs.waybar}/bin/waybar --config ${niriWaybarConfig} --style ${./waybar.css}"
        ];

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
        "XF86MonBrightnessUp".action.spawn = [ "${pkgs.brightnessctl}/bin/brightnessctl" "set" "+10%" ];
        "XF86MonBrightnessDown".action.spawn = [ "${pkgs.brightnessctl}/bin/brightnessctl" "set" "10%-" ];

        # Screenshots (clipboard only)
        "Print".action.screenshot-screen = {};
        "Ctrl+Shift+4".action.screenshot = {};
      };
    };
  };

  home.packages = with pkgs; [
    brightnessctl
    swaybg
    xwayland-satellite
  ];
}
