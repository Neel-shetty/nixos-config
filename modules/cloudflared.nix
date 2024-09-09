{ config, pkgs, ... }:
let
  start-cloudflared = pkgs.writeShellScript "start-cloudflared" ''
    cat ${config.sops.secrets.cloudflared-tunnel-token.path} | xargs -I {} ${pkgs.cloudflared}/bin/cloudflared tunnel run --token {}
  '';
in {
  systemd.services.cloudflared = {
    # uncomment line below to enable service
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "network-online.target" ];
    wants = [ "network.target" "network-online.target" ];
    serviceConfig = {
      ExecStart = "${start-cloudflared}";
      Restart = "always";
      RestartSec = "3";
      User = "neel";
      Group = "users";
    };
  };
}
