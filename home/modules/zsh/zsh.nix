{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [{
      name = "powerlevel10k-config";
      src = lib.cleanSource ./.;
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
      la = "ls -la";
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
      cd = "z";
    };
    initExtra = "eval \"$(zoxide init zsh)\"";
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };
}
