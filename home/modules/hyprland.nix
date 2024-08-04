{ config, pkgs, ... }: {

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.extraConfig = ''
    animations {
              enabled = yes
              bezier = wind, 0.05, 0.9, 0.1, 1.05
              bezier = winIn, 0.1, 1.1, 0.1, 1.1
              bezier = winOut, 0.3, -0.3, 0, 1
              bezier = liner, 1, 1, 1, 1
              animation = windows, 1, 6, wind, slide
              animation = windowsIn, 1, 6, winIn, slide
              animation = windowsOut, 1, 5, winOut, slide
              animation = windowsMove, 1, 5, wind, slide
              animation = border, 1, 1, liner
              animation = fade, 1, 10, default
              animation = workspaces, 1, 5, wind
            }
  '';
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$term" = "kitty";
    "$browser" = "brave";
    "$files" = "thunar";
    env = [
      "LIBVA_DRIVER_NAME=nvidia"
      "XDG_SESSION_TYPE=wayland"
      "GBM_BACKEND=nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME=nvidia"
      "CLUTTER_BACKEND=wayland"
      "GDK_BACKEND=wayland,x11"
      "QT_AUTO_SCREEN_SCALE_FACTOR=1"
      "QT_SCALE_FACTOR=1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
      "XDG_CURRENT_DESKTOP=Hyprland"
      "XDG_SESSION_DESKTOP=Hyprland"
    ];
    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
      special_scale_factor = 0.8;
    };
    master = {
      new_status = "master";
      new_on_top = 0;
      mfact = 0.5;
    };
    general = {
      sensitivity = 2.5;
      apply_sens_to_raw = 1;
      gaps_in = 8;
      gaps_out = 8;
      border_size = 1;
      resize_on_border = true;
    };
    group = {
      "col.border_active" = "rgba(7aa2f7aa)";
      groupbar = { "col.active" = "rgba(7aa2f7aa)"; };
    };
    windowrule = [
      "float, pavucontrol"
      "float, org.kde.polkit-kde-authentication-agent-1"
      "float, nm-connection-editor|blueman-manager"
      "float, nwg-look|qt5ct|mpv"
      "float, onedriver|onedriver-launcher"
      "float, viewnior|swayimg"
      "float, rofi"
      "float, gnome-system-monitor"
      "float, yad"
      "workspace 6 silent,^(gamescope)$"
      "center,^(pavucontrol)"
    ];
    windowrulev2 = [
      "float, class:^([Vv]iewnior)$"
      "workspace 1, class:^(signal)$"
      "workspace 1, class:^(org.telegram.desktop)$"
      "workspace 2, class:^(firefox)$"
      "workspace 2, class:^(brave-browser)$"
      "workspace 2, class:^(Firefox-esr)$"
      "workspace 3, class:^([Tt]hunar)$"
      "workspace 4, class:^(org.jellyfin.jellyfinmediaplayer)$"
      "workspace 5, class:^(org.qbittorrent.qBittorrent)$"
      "workspace 6, class:^([Ss]team)$,title:^([Ss]team)$"
      "workspace 6, class:^(lutris)$"
      "workspace 7, class:^(discord)$"
      "workspace 7, class:^(WebCord)$"
      "workspace 9 silent, class:^(audacious)$"
      "opacity 0.9 0.6, class:^([Rr]ofi)$"
      "opacity 1 0.7, class:^(firefox)$"
      "opacity 0.9 0.7, class:^([Tt]hunar)$"
      "opacity 0.8 0.6, class:^(pcmanfm-qt)$"
      "opacity 0.9 0.7, class:^(gedit)$"
      "opacity 0.8 0.7, class:^(kitty)$"
      "opacity 0.9 0.7, class:^(codium-url-handler)$"
      "opacity 0.9 0.7, class:^(VSCodium)$"
      "opacity 0.9 0.7, class:^(yad)$"
    ];
    decoration = {
      rounding = 8;

      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;

      dim_inactive = true;
      dim_strength = 0.1;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 1;
      "col.shadow" = "rgb(cba7f7)";
      "col.shadow_inactive" = "0x50000000";

      blur = {
        enabled = true;
        size = 5;
        passes = 1;
        ignore_opacity = true;
        new_optimizations = true;
      };
    };
    # animations = {
    #   enabled = "yes";
    #   # enabled = no

    #   bezier = [
    #     "myBezier, 0.05, 0.9, 0.1, 1.05"
    #     "linear, 0.0, 0.0, 1.0, 1.0"
    #     "wind, 0.05, 0.9, 0.1, 1.05"
    #     "winIn, 0.1, 1.1, 0.1, 1.1"
    #     "winOut, 0.3, -0.3, 0, 1"
    #     "slow, 0, 0.85, 0.3, 1"
    #     "overshot, 0.7, 0.6, 0.1, 1.1"
    #     "bounce, 1.1, 1.6, 0.1, 0.85"
    #     "sligshot, 1, -1, 0.15, 1.25"
    #     "nice, 0, 6.9, 0.5, -4.20"
    #   ];

    #   animation = [
    #     "windowsIn, 1, 5, slow, popin"
    #     "windowsOut, 1, 5, winOut, popin"
    #     "windowsMove, 1, 5, wind, slide"
    #     "border, 1, 10, linear"
    #     "borderangle, 1, 100, linear, loop "
    #     "fade, 1, 5, overshot"
    #     "workspaces, 1, 5, wind"
    #     "windows, 1, 5, bounce, popin"
    #   ];
    # };
    input = {
      kb_layout = "us";
      # kb_variant=
      # kb_model=
      kb_options = "grp:alt_shift_toggle";
      # kb_rules=
      repeat_rate = 50;
      repeat_delay = 300;
      numlock_by_default = 0;
      left_handed = 0;
      follow_mouse = 1;
      float_switch_override_focus = 0;

      touchpad = {
        disable_while_typing = 0;
        natural_scroll = 1;
        clickfinger_behavior = 0;
        middle_button_emulation = 1;
        tap-to-click = 1;
        drag_lock = 0;
      };
    };
    gestures = {
      workspace_swipe = 1;
      workspace_swipe_fingers = 3;
      workspace_swipe_distance = 200;
      workspace_swipe_invert = 1;
      workspace_swipe_min_speed_to_force = 30;
      workspace_swipe_cancel_ratio = 0.5;
      workspace_swipe_create_new = 1;
      workspace_swipe_forever = 1;
    };
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      mouse_move_enables_dpms = true;
      vrr = 2;
      enable_swallow = true;
      no_direct_scanout = true; # for fullscreen games
      focus_on_activate = false;
      swallow_regex = "^(kitty)$";
    };

    binds = {
      workspace_back_and_forth = 1;
      allow_workspace_cycles = 1;
      pass_mouse_when_bound = 0;
    };
    cursor = { no_hardware_cursors = true; };
    exec-once = [
      "waybar &"
      "dunst -conf ~/.config/dunst/dunstrc &"
      "swww-daemon &"
      "nm-applet --indicator &"
      "wl-paste --watch cliphist store"
    ];
    monitor = [ "eDP-1,1920x1080@144,auto,1" ",1280x1024,auto,1" ];

    bind = [
      "$mod, B, exec, brave"
      "$mod, D, exec, pkill rofi || rofi -show drun -modi run,drun,filebrowser"
      "$mod, F1, focusmonitor, +1"
      "$mod, F2, focusmonitor, -1"
      "$mod, Return, exec, $term"
      "$mod SHIFT, Q, killactive, "
      "$mod SHIFT, F, togglefloating,"
      "$mod, F, fullscreen"
      "$mod, Q, killactive,"
      "$mod, T, exec, $files"
      "CTRL ALT, P, exec, wlogout"
      "$mod, tab, workspace, m+1"
      "$mod SHIFT, tab, workspace, m-1"
      ", Print, exec, hyprshot -m region -o ~/Pictures/Screenshots"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      "$mod, mouse:272, movewindow"
      "$mod, Print, exec, hyprshot -m output -o ~/Pictures/Screenshots"
      "$mod, S, exec, hyprshot -m region -o ~/Pictures/Screenshots"
      "$mod CTRL, D, layoutmsg, removemaster"
      "$mod, Escape, exec, hyprctl kill"
      "$mod, I, layoutmsg, addmaster"
      "$mod, J, layoutmsg, cyclenext"
      "$mod, K, layoutmsg, cycleprev"
      "$mod, M, exec, hyprctl dispatch splitratio 0.3"
      "$mod, P, pseudo, # dwindle"
      "$mod CTRL, Return, layoutmsg, swapwithmaster"
      "$mod, V, exec, pkill rofi || cliphist list | rofi -dmenu -config ~/.config/rofi/config-long.rasi | cliphist decode | wl-copy"
      "$mod, G, togglegroup"
      "$mod, tab, workspace, m+1"
      "$mod SHIFT, tab, workspace, m-1"
      "ALT, tab, cyclenext,"
      "ALT SHIFT, tab, bringactivetotop, "
      ", xf86audioraisevolume, exec, pamixer --allow-boost -i 5 && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low $(pamixer --get-volume) "
      ", xf86audiolowervolume, exec, pamixer --allow-boost -d 5 && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low $(pamixer --get-volume) "
      ", xf86audiomute, exec, pamixer -t && notify-send Mute "
      ''
        , xf86AudioMicMute, exec, pamixer --default-source --get-mute | grep -q false && pamixer --default-source -m && notify-send "Mic Switched OFF" || pamixer --default-source -u && notify-send "Mic Switched ON"''
      ", xf86MonBrightnessDown, exec, brightnessctl set 10%- && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low $(brightnessctl -m | cut -d, -f4)"
      ", xf86MonBrightnessUp, exec, brightnessctl set +10% && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low $(brightnessctl -m | cut -d, -f4) "
      # Resize (vim style)
      "$mod SHIFT, H, resizeactive, -50 0"
      "$mod SHIFT, L, resizeactive, 50 0"
      "$mod SHIFT, K, resizeactive, 0 -50"
      "$mod SHIFT, J, resizeactive, 0 50"
      "$mod SHIFT, left, resizeactive, -50 0"
      "$mod SHIFT, right, resizeactive, 50 0"
      "$mod SHIFT, up, resizeactive, 0 -50"
      "$mod SHIFT, down, resizeactive, 0 50"

      # Move (vim style)
      "$mod CTRL, H, movewindow, l"
      "$mod CTRL, L, movewindow, r"
      "$mod CTRL, K, movewindow, u"
      "$mod CTRL, J, movewindow, d"
      "$mod CTRL, left, movewindow, l"
      "$mod CTRL, right, movewindow, r"
      "$mod CTRL, up, movewindow, u"
      "$mod CTRL, down, movewindow, d"

      # Move focus with mod + arrow keys
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Special workspace
      "$mod SHIFT, U, movetoworkspace, special"
      "$mod, U, togglespecialworkspace,"

      # scroll to change workspace with mod + scroll
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      "$mod, period, workspace, e+1"
      "$mod, comma, workspace, e-1"

    ] ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (x:
        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
        ]) 10));
    bindl = [''
      ,switch:Lid Switch, exec, hyprctl keyword monitor "eDP-1, preferred, auto, 1"
    ''];
    bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
  };
}
