{ config, lib, pkgs, ... }:

let

  size = if pkgs.stdenv.isDarwin then 18 else 12;

in

{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = size;
        normal = {
          family = "FiraCode Nerd Font Mono";
        };
        bold = {
          style = "Regular";
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
      };

      window = {
        dynamic_padding = true;
      };

      # Base16 Gruvbox dark, hard - alacritty color config
      # Dawid Kurek (dawikur@gmail.com), morhetz (https =//github.com/morhetz/gruvbox)
      # colors = {
      #   # Default colors
      #   primary = {
      #     background = "0x1d2021";
      #     foreground = "0xd5c4a1";
      #   };

      #   # Colors the cursor will use if `custom_cursor_colors` is true
      #   cursor = {
      #     text = "0x1d2021";
      #     cursor = "0xd5c4a1";
      #   };

      #   # Normal colors
      #   normal = {
      #     black =   "0x1d2021";
      #     red =     "0xfb4934";
      #     green =   "0xb8bb26";
      #     yellow =  "0xfabd2f";
      #     blue =    "0x83a598";
      #     magenta = "0xd3869b";
      #     cyan =    "0x8ec07c";
      #     white =   "0xd5c4a1";
      #   };

      #   # Bright colors
      #   bright = {
      #     black =   "0x665c54";
      #     red =     "0xfe8019";
      #     green =   "0x3c3836";
      #     yellow =  "0x504945";
      #     blue =    "0xbdae93";
      #     magenta = "0xebdbb2";
      #     cyan =    "0xd65d0e";
      #     white =   "0xfbf1c7";
      #   };
      # };

      colors = {
        # Default colors
        primary = {
          background = "0x24292e";
          foreground = "0xc9d1d9";
        };

        # Colors the cursor will use if `custom_cursor_colors` is true
        cursor = {
          text = "0x24292e";
          cursor = "0xc9d1d9";
        };

        # Normal colors
        normal = {
          black =   "0x24292e";
          red =     "0xf14c4c";
          green =   "0x23d18b";
          yellow =  "0xe2e210";
          blue =    "0x3b8eea";
          magenta = "0xbc3fbc";
          cyan =    "0x29b8db";
          white =   "0xb1bac4";
        };

        # Bright colors
        bright = {
          black =   "0x666666";
          red =     "0xf14c4c";
          green =   "0x23d18b";
          yellow =  "0xf5f543";
          blue =    "0x3b8eea";
          magenta = "0xd670d6";
          cyan =    "0x29b8db";
          white =   "0xe5e5e5";
        };
      };

      draw_bold_text_with_bright_colors = false;
    };
  };
}
