{ config, lib, pkgs, ... }:

{
  services.picom = {
    enable = true;

    vSync = true;
    shadow = true;
    wintypes = {
      tooltip = { shadow = false; opacity = 0.95; };
      dock = {
        shadow = false;
        opacity = 0.7;
      };
      dnd = { shadow = false; };
      menu = { shadow = false; };
      popup_menu = { opacity = 1.0; shadow = false; };
      dropdown_menu = { opacity = 0.8; shadow = false; };
    };
    settings = {
      corner-radius = 5;
    };
  };
}
