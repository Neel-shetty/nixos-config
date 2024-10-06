
{ pkgs }:
pkgs.writeShellScriptBin "bluebat" ''
  bluetoothctl info | grep -i battery  | awk '{print $4}'  | tr -d '()'
''
