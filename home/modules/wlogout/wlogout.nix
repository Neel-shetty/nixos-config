{ config, pkgs, lib, ... }:
let
  bgImageSection = name: ''
    #${name} {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/${name}.png"));
    }
  '';
in {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "logout";
        "action" = "hyprctl dispatch exit 0";
        "text" = "Exit";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "lock";
        "action" = "swaylock";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
    ];
    style = ''
           window {
          font-family: monospace;
          font-size: 14pt;
          color: #cdd6f4; /* text */
          background-color: rgba(30, 30, 46, 0.5);
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border: none;
          background-color: rgba(30, 30, 46, 0);
          margin: 5px;
          transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
          background-color: rgba(49, 50, 68, 0.1);
      }

      button:focus {
          background-color: #cba6f7;
          color: #1e1e2e;
      }

       ${
         lib.concatMapStringsSep "\n" bgImageSection [
           "logout"
           "suspend"
           "shutdown"
           "reboot"
           "lock"
           "hibernate"
         ]
       }
    '';
  };
}
