{ config, lib, pkgs, ... }:

{
  services.picom = {
    enable = true;

    backend = "glx";
    vSync = true;
    shadow = true;
    wintypes = {
      tooltip = { fade = true; shadow = true; opacity = 0.95; focus = true; full-shadow = false; };
      dock = {
        shadow = false;
        opacity = 0.7;
      };
      dnd = { shadow = false; };
      menu = { shadow = false; };
      popup_menu = { opacity = 0.95; };
      dropdown_menu = { opacity = 0.8; };
    };
    settings = {
      corner-radius = 5;
    };
  };
}
