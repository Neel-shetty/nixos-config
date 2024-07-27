{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = false;
    extraConfig = {
      modi = "run,drun,window";
      icon-theme = "Adwaita";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󰕰  Window";
      display-Network = " 󰤨  Network";
      sidebar-mode = true;
    };
    font = "JetBrainsMono Nerd Font 14";
    theme = ./catppuccin-mocha.rasi;
  };
}
