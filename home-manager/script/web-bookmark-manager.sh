#!/bin/sh

# Check if a database file path is provided, else use a default
BOOKMARKS_FILE="${1:-./bookmarks}"

# Ensure the file exists
if [ ! -f "$BOOKMARKS_FILE" ]; then
  echo "Error: File '$BOOKMARKS_FILE' not found!"
  exit 1
fi

# Use fzf to select a bookmark based on URL or tags
selected=$(cat "$BOOKMARKS_FILE" | wmenu -l 30)

# If nothing was selected, exit
[ -z "$selected" ] && exit

# Extract the URL from the selection
echo "$selected" | awk -F, '{print $3}' | wl-copy; wl-paste

