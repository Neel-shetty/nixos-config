{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 12px;
        min-height: 0;
      }

      #waybar {
        background: transparent;
        color: @text;
        margin: 5px 5px;
      }

      #workspaces {
        border-radius: 1rem;
        margin: 5px;
        background-color: @surface0;
        margin-left: 1rem;
      }

      #workspaces button {
        color: @lavender;
        border-radius: 1rem;
        padding: 0.4rem;
      }

      #workspaces button.active {
        color: @maroon;
        border-radius: 1rem;
      }

      #workspaces button:hover {
        color: @sapphire;
        border-radius: 1rem;
      }

      #custom-music,
      #cpu,
      #power-profiles-daemon,
      #memory,
      #tray,
      #backlight,
      #clock,
      #network,
      #battery,
      #pulseaudio,
      #custom-lock,
      #custom-power {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }

      #clock {
        color: @blue;
        border-radius: 1rem 0px 0px 1rem;
        margin-left: 1rem;
      }

      #power-profiles-daemon {
        color: @pink;
      }

      #network {
        color: @lavender;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }
      #cpu {
        color: @yellow;
        border-radius: 1rem 0px 0px 1rem;
        margin-left: 1rem;
      }

      #memory {
        color: @green;
      }

      #backlight {
        color: @pink;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #battery {
        color: @green;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #battery.charging {
        color: @yellow;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #battery.warning:not(.charging) {
        color: @red;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }


      #pulseaudio {
        color: @maroon;
        border-radius: 1rem 0px 0px 1rem;
        margin-left: 1rem;
      }

      #custom-music {
        color: @mauve;
        border-radius: 1rem;
      }

      #custom-lock {
          border-radius: 1rem 0px 0px 1rem;
          color: @lavender;
      }

      #custom-power {
          margin-right: 1rem;
          border-radius: 0px 1rem 1rem 0px;
          color: @red;
      }

      #tray {
        margin-right: 1rem;
        border-radius: 1rem;
      }
    '';
    settings = [{
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" "cpu" "memory" "backlight" ];
      modules-center = [ "clock" "network" ];
      modules-right = [
        "pulseaudio"
        "power-profiles-daemon"
        "battery"
        "tray"
        "custom/lock"
        "custom/power"
      ];

      "hyprland/workspaces" = {
        "sort-by-name" = true;
        "format" = " {icon} ";
        "format-icons" = { "default" = ""; };
        active-only = false;
        "all-outputs" = true;
        "show-special" = false;
        "on-click" = "activate";
        "on-scroll-up" = "hyprctl dispatch workspace e+1";
        "on-scroll-down" = "hyprctl dispatch workspace e-1";
        "persistent-workspaces" = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
          "5" = [ ];
        };
        # "format-icons" = {
        #   "active" = "";
        #   "default" = "";
        # };
      };

      "power-profiles-daemon" = {
        "format" = "{icon}";
        "tooltip-format" = ''
          Power profile: {profile}
          Driver: {driver}'';
        "tooltip" = true;
        "format-icons" = {
          "default" = "";
          "performance" = "";
          "balanced" = "";
          "power-saver" = "";
        };
      };

      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };
      "memory" = {
        "interval" = 10;
        "format" = "{used:0.1f}G 󰾆";
        "format-alt" = "{percentage}% 󰾆";
        "format-alt-click" = "click";
        "tooltip" = true;
        "tooltip-format" = "{used:0.1f}GB/{total:0.1f}G";
        "on-click-right" = "kitty --title btop sh -c 'btop'";
      };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "Disconnected ⚠";
        format-ethernet =
          "{ifname}: {ipaddr}/{cidr}   󰁟: {bandwidthUpBits} down: {bandwidthDownBits}";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "󰁇 {bandwidthDownBits}";
      };

      "tray" = {
        "icon-size" = 21;
        "spacing" = 10;
      };

      "clock" = {
        "tooltip-format" = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
        "format-alt" = "  {:%d/%m/%Y}";
        "format" = "󰥔  {:%H:%M}";
      };

      "backlight" = {
        "scroll-step" = 10; # %, can be a float
        "device" = "intel_backlight";
        "format" = "{icon}";
        "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
      };

      "battery" = {
        "states" = {
          "warning" = 30;
          "critical" = 15;
        };
        "format" = "{icon}";
        "format-charging" = "󰂄";
        "format-plugged" = "";
        "format-alt" = "{icon}";
        "format-icons" = [ "󰢜" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
      };

      "pulseaudio" = {
        "scroll-step" = 5; # %, can be a float
        "format" = "{icon} {volume}%";
        "format-muted" = "";
        "format-icons" = { "default" = [ "" "" " " ]; };
        "on-click" = "pavucontrol";
      };

      "custom/lock" = {
        "tooltip" = false;
        "on-click" = "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
        "format" = "";
      };

      "custom/power" = {
        "tooltip" = false;
        "on-click" = "wlogout &";
        "format" = "襤";
      };
    }];

  };
}
