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
    # master = [ "new_is_master = 0" "new_on_top = 0" "mfact = 0.5" ];
    general = {
      sensitivity = 2.5;
      apply_sens_to_raw = 1;
      gaps_in = 8;
      gaps_out = 8;
      border_size = 1;
      resize_on_border = true;
    };
    # group = {
    #   col.border_active = "rgba (7 aa2f7aa)";
    #   groupbar = { col.active = "rgba (7 aa2f7aa)"; };
    # };
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
      # col.shadow = "rgb (cba7f7)";
      # col.shadow_inactive = "0x50000000";

      blur = {
        enabled = true;
        size = 5;
        passes = 1;
        ignore_opacity = true;
        new_optimizations = true;
      };
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
    cursor = { no_hardware_cursors = true; };
    exec-once = [ "waybar &" "dunst &" "nm-applet --indicator &" ];
    monitor = [ "eDP-1,1920x1080@144,auto,1" ",1280x1024,auto,1" ];
    bind = [
      "$mod, F, exec, brave"
      "$mod, F1, focusmonitor, +1"
      "$mod, F2, focusmonitor, -1"
      "$mod, Return, exec, $term"
      "$mod SHIFT, Q, killactive, "
      "$mod SHIFT, F, togglefloating,"
      "$mod, F, fullscreen"
      "$mod, Q, killactive,"
      "$mod, T, exec, $files"
      "$mod, tab, workspace, m+1"
      "$mod SHIFT, tab, workspace, m-1"
      ", Print, exec, grimblast copy area"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      "$mod, mouse:272, movewindow"
      "$mod, Print, exec, hyprshot -m output -o ~/Pictures/Screenshots"
    ] ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (x:
        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]) 10));
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
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        {
          name = "zsh-users/zsh-syntax-highlighting";
        } # Simple plugin installation
      ];
    };

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

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
    webcord-vencord
    wine
    lutris
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
