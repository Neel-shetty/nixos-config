{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autocd = true;
    completionInit = ''
      # On slow systems, checking the cached .zcompdump file to see if it must be 
      # regenerated adds a noticable delay to zsh startup.  This little hack restricts 
      # it to once a day.  It should be pasted into your own completion file.
      #
      # The globbing is a little complicated here:
      # - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
      # - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
      # - '.' matches "regular files"
      # - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
      # autoload -Uz compinit 
      # if [[ -n ''${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
      # 	compinit;
      # else
      # 	compinit -C;
      # fi;
    '';
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [{
      name = "powerlevel10k-config";
      src = lib.cleanSource ./.;
      file = ".p10k.zsh";
    }];
    # initExtraFirst = "zmodload zsh/zprof";
    zplug = {
      enable = true;
      plugins = [
        # { name = "zsh-users/zsh-autosuggestions"; }
        # { name = "zsh-users/zsh-syntax-highlighting"; }
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
    initExtra = ''
      eval "$(zoxide init zsh)"
      eval "$(direnv hook zsh)"
      # zprof
    '';
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };
}
