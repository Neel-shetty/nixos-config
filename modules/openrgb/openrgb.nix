{ config, pkgs, ... }:
let
  openrgb-rules = builtins.fetchurl {
    url = "https://openrgb.org/releases/release_0.9/60-openrgb.rules";
    sha256 = "0f5bmz0q8gs26mhy4m55gvbvcyvd7c0bf92aal4dsyg9n7lyq6xp";
  };
in {
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];
  services.udev.extraRules =  ''
    ${builtins.readFile ./70-openrgb.rules}
  '';
}
