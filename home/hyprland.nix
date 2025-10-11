{ pkgs, inputs, ... }:

let

  background = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/acfd27ad750277053e4bb6784547a634ce2cc264/images/ign_colorful.png";
    hash = "sha256-Rows/HKVlAdjlGz/LrRWKqOTYNO11YJ0UPFYVgpCOnI=";
  };

in
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    TERMINAL = "ghostty";
  };

  programs.kitty.enable = true;

  home.packages = with pkgs; [
    walker
    ghostty
    playerctl
    wl-clipboard
    flameshot
    wdisplays
  ];
  
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 12;
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
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "tray" "network" "memory" "disk" "pulseaudio" "battery" "clock" ];

        "hyprland/window" = {
          separate-outputs = true;
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

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    plugins = [ inputs.hy3.packages.x86_64-linux.hy3 ];
    settings = {
      "$mod" = "SUPER";

      "$terminal" = "ghostty";
      "$menu" = "${pkgs.wofi}/bin/wofi --style=${./wofi.css} --show run";

      monitor = [
        ", highres, auto, 1.6"
      ];

      exec-once = [
        "waybar &"
        "${pkgs.swaybg}/bin/swaybg -i ${background} -m fill &"
      ];

      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, D, exec, $menu"
        "$mod SHIFT, Q, killactive"
        "$mod, F, fullscreen"

        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, mouse:272, movewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5 %-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-d, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      general = {
        gaps_in = "4";
        gaps_out = "4";
        border_size = "1";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 2;
        rounding_power = 2;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      xwayland = {
        force_zero_scaling = true;
        use_nearest_neighbor = true;
      };

      env = [
        "GDK_SCALE,2"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      input = {
        kb_options = "ctrl:nocaps";
        repeat_delay = 200;
        repeat_rate = 40;

        touchpad = {
          clickfinger_behavior = true;
        };
      };
    };
  };
}
