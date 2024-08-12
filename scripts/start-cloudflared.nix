{ pkgs, config }:
pkgs.writeShellScriptBin "start-cloudflared.sh" ''
  cat ${config.sops.secrets.cloudflared-tunnel-token.path} | xargs -I {} ${pkgs.cloudflared}/bin/cloudflared tunnel run --token {}'
''
