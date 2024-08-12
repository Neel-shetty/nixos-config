{ pkgs, config, ... }:
let
  obsidian-git = pkgs.writeShellScript "obsidian-git" ''
    cd /home/neel/Documents/obsidian/notes || exit

    # Add all changes to the staging area
    git add .

    # Check if there are any changes to commit
    if git diff-index --quiet HEAD --; then
        # No changes to commit
        exit 0
    fi

    # Commit changes
    git commit -m "daily-commit"

    # Push changes
    if git push; then
        # Success notification
        notify-send "Git Push" "Daily commit and push were successful."
    else
        # Failure notification
        notify-send "Git Push" "Failed to push the daily commit."
    fi
  '';
in {
  services.cron = {
    enable = true;
    systemCronJobs = [ "0 21 * * * ${obsidian-git}" ];
  };
}
