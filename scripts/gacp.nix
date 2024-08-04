{ pkgs }:
pkgs.writeShellScriptBin "gacp" ''
  if [ -z "$1" ]; then
    ${pkgs.figlet}/bin/figlet "No Commit Message"
    echo "Using \"Updates\" as commit message instead"
    git add .
    git commit -m "Updates"
    git push
  else
    git add .
    git commit -m "$1"
    git push
  fi
''
