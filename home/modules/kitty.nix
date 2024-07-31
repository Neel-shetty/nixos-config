{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    # font = pkgs.jetbrains-mono;
    font.name = "JetBrains Mono Nerd Font";
    font.size = 13;
    settings = {
      enable_audio_bell = false;
    };
    shellIntegration.enableZshIntegration = true;
  };
}
