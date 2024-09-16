{ config, pkgs, ... }: {
  programs.firefox.enable = true;
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
      { id = "bkkmolkhemgaeaeggcmfbghljjjoofoh"; } # catppuccin theme brave
      { id = "clngdbkpkpeebahjckkjfobafhncgmne"; } # stylus, catppuccin for websites
    ];
  };
}
