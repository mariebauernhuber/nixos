REPO_PATH="/etc/nixos/"  # Change to your git repo path, e.g., ~/dotfiles
BRANCH="master"  # Change if needed, e.g., master

cd "$REPO_PATH" || exit 1

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    notify-send "Git Update Check" "Not a git repo: $REPO_PATH" && exit 1
fi

git fetch origin "$BRANCH" >/dev/null 2>&1
LOCAL=$(git rev-parse "$BRANCH")
REMOTE=$(git rev-parse "origin/$BRANCH")

if [ "$LOCAL" != "$REMOTE" ]; then
    CHOICE=$(echo -e "Pull\nSkip" | wofi --dmenu --prompt "Updates available in $REPO_PATH" --insensitive || echo "skip")
    if [ "$CHOICE" = "Pull" ]; then
        git pull origin "$BRANCH"
        notify-send "Git Update" "Pulled updates from $REPO_PATH"
    else
        notify-send "Git Update" "Skipped updates for $REPO_PATH"
    fi
else
    notify-send "Git Update Check" "No updates available for $REPO_PATH"
fi

