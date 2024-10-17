{ config, pkgs, ... }:
let
  openrgb-rules = builtins.fetchurl {
    url = "https://openrgb.org/releases/release_0.9/60-openrgb.rules";
  }
in {
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];
  services.udev.extraRules =  builtins.readFile openrgb-rules;
}
