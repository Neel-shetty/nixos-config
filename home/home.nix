{ config, pkgs, inputs, ... }:

{
  home.username = "neel";
  home.homeDirectory = "/home/neel";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./modules/zsh/zsh.nix
    ./modules/rofi/rofi.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/kitty.nix
    ./modules/browser.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    signal-desktop
    xdotool
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

  programs.nix-index-database.comma.enable = true;
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

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
