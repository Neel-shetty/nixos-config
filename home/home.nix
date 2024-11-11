{ config, pkgs, inputs, lib, ... }:

{
  home.username = "neel";
  home.homeDirectory = "/home/neel";
  home.stateVersion = "24.05";

  services.mpris-proxy.enable = true;
  services.gnome-keyring.enable = true;

  imports = [
    ./modules/zsh/zsh.nix
    ./modules/rofi/rofi.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/kitty.nix
    ./modules/browser.nix
    # ./modules/neovim/neovim.nix
    ./modules/swaylock.nix
    ./modules/wlogout/wlogout.nix
    ./modules/tmux.nix
  ];

  home.packages = with pkgs; [
    piper
    openrgb
    i2c-tools
    dbeaver-bin
    gdb
    pkg-config
    mono
    p7zip
    atuin
    openvpn3
    space-cadet-pinball
    virtiofsd
    signal-desktop
    file
    activitywatch
    distrobox
    tmux
    gamescope
    ryujinx
    protonvpn-gui
    pureref
    fzf
    bat
    zoxide
    gnumake
    obs-studio
    unzip
    zip
    ripgrep
    cava
    swww
    swaylock
    power-profiles-daemon
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
    (calibre.override { unrarSupport = true; })
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
    wine64
    (wine.override { wineBuild = "wine64"; })
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
    nb
    neofetch
    musikcube
    mpv
    gparted
    gh
    figlet
    code-server
    cloudflared
    android-file-transfer
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    jellyfin-media-player
    guacamole-server
    guacamole-client


    # dev env
    android-studio
    android-studio-tools

    # programming languages
    lua
    lua-language-server
    python3
    jdk22
    nodejs_22
    go
    rustup
    zig
    gcc

    # databases
    pgadmin4-desktopmode

    # fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # scripts
    (import ../scripts/gacp.nix { inherit pkgs; })
    (import ../scripts/bluebat.nix { inherit pkgs; })
  ];

  programs.nix-index-database.comma.enable = true;
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.file = {
    ".config/btop/btop.conf".source = ./modules/btop/btop.conf;
    ".config/btop/themes/catppuccin-mocha.theme".source =
      ./modules/btop/catppuccin-mocha.theme;
    ".config/obs-studio/themes".source = ./modules/obs/themes;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;
}
