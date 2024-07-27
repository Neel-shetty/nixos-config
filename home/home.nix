{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "neel";
  home.homeDirectory = "/home/neel";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  wayland.windowManager.hyprland.enable = true;
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
      "workspace 1, class:^(Signal)$"
      "workspace 1, class:^(telegram)$"
      "workspace 2, class:^(firefox)$"
      "workspace 2, class:^(Brave-browser)$"
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
    animations = {
      enabled = "yes";
      # enabled = no

      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "linear, 0.0, 0.0, 1.0, 1.0"
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "slow, 0, 0.85, 0.3, 1"
        "overshot, 0.7, 0.6, 0.1, 1.1"
        "bounce, 1.1, 1.6, 0.1, 0.85"
        "sligshot, 1, -1, 0.15, 1.25"
        "nice, 0, 6.9, 0.5, -4.20"
      ];

      animation = [
        "windowsIn, 1, 5, slow, popin"
        "windowsOut, 1, 5, winOut, popin"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 10, linear"
        "borderangle, 1, 100, linear, loop "
        "fade, 1, 5, overshot"
        "workspaces, 1, 5, wind"
        "windows, 1, 5, bounce, popin"
      ];
    };
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
      "dunst &"
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
      ", xf86audiomute, exec, pamixer -t && notify-send $(pamixer --get-volume) "
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
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
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
          /* reference the color by using @color-name */
          color: @text;
        }

        window#waybar {
          /* you can also GTK3 CSS functions! */
          background-color: shade(@base, 0.9);
          border: 2px solid alpha(@crust, 0.3);
        }
    '';
    settings = [{
      height = 30;
      layer = "top";
      position = "top";
      tray = { spacing = 10; };
      modules-center = [ "sway/window" ];
      modules-left = [ "hyprland/workspaces" ];
      modules-right = [
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "temperature"
        "clock"
        "tray"
        "power"
      ];
      battery = {
        format = "{capacity}% {icon}";
        format-alt = "{time} {icon}";
        format-charging = "{capacity}% ";
        format-icons = [ "" "" "" "" "" ];
        format-plugged = "{capacity}% ";
        states = {
          critical = 15;
          warning = 30;
        };
      };
      clock = {
        format-alt = "{:%Y-%m-%d}";
        tooltip-format = "{:%Y-%m-%d | %H:%M}";
      };
      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };
      memory = { format = "{}% "; };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "Disconnected ⚠";
        format-ethernet =
          "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%) ";
      };
      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          handsfree = "";
          headphones = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        on-click = "pavucontrol";
      };
      "sway/mode" = { format = ''<span style="italic">{}</span>''; };
      "hyprland/workspaces" = {
        active-only = false;
        "all-outputs" = true;
        "format" = "{icon}";
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
        "format-icons" = {
          "active" = "";
          "default" = "";
        };
      };
      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };
    }];
  };

  programs.git = {
    enable = true;
    userName = "Neel Narayan Shetty";
    userEmail = "neelnarayanshetty@gmail.com";
  };
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "ponfpcnoihfmfllpaingbgckeeldkhle"; } # enhancer for youtube
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # sponsorblock
      { id = "gebbhagfogifgggkldgodflihgfeippi"; } # return youtube dislikes
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [{
      name = "powerlevel10k-config";
      src = ./.;
      file = ".p10k.zsh";
    }];
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        } # Installations with additional options. For the list of options, please refer to Zplug README.

      ];
    };
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      e = "exit";
      sex = "neofetch";
      c = "clear";
      h = "htop";
      pd = "cd ..";
      anime = "cd /media/neel/data/jellyfin/anime";
      ssh = "kitten ssh";
      size = "du -sh .";
      files = "thunar .";
      b = "bashtop";
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    };
  };
  programs.nix-index-database.comma.enable = true;
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
  # programs.kitty = {
  #   enable = true;
  #   # theme = "Catppuccin-Mocha";
  # };

  gtk = {
    enable = true;
    # catppuccin = {
    #   enable = true;
    #   flavor = "mocha";
    #   accent = "pink";
    #   size = "standard";
    #   tweaks = [ "normal" ];
    # };

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

  };
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    signal-desktop
    pavucontrol
    brightnessctl
    viewnior
    eog
    direnv
    pamixer
    networkmanagerapplet
    hyprshot
    waybar
    dunst
    libnotify
    wl-clipboard
    wlogout
    rofi-wayland
    kitty
    virt-manager
    vscode
    htop
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.exo # thunar "open terminal here"
    xfce.thunar-volman
    xfce.tumbler # thunar thumbnails
    xfce.xfce4-volumed-pulse
    xfce.xfconf # thunar save settings
    webcord-vencord
    wine
    lutris
    cliphist
    steam
    libreoffice
    gimp
    gnome-disk-utility
    baobab
    anydesk
    btop
    gamemode
    heroic
    jq
    komikku
    less
    nixfmt-classic
    lf
    mangohud
    man
    man-pages
    postman
    pureref
    qbittorrent
    telegram-desktop
    tree
    unrar
    warp-terminal
    winetricks
    yt-dlp
    zathura
    mupdf
    notion-app-enhanced
    nb
    neofetch
    musikcube
    mpv
    gparted
    gh
    figlet
    pgadmin4
    code-server
    cloudflared
    android-file-transfer
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    jellyfin-media-player
    guacamole-server
    guacamole-client

    # programming languages
    python3
    nodejs_22
    go
    rustup
    zig
    gcc

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/neel/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
