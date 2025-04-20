#!/bin/sh

# Check if a database file path is provided, else use a default
BOOKMARKS_FILE="${1:-$HOME/.secret/bookmarks}"

# Ensure the file exists
if [ ! -f "$BOOKMARKS_FILE" ]; then
  echo "Error: File '$BOOKMARKS_FILE' not found!"
  exit 1
fi

# Use wmenu to select a bookmark based on URL or tags
selected=$(cat "$BOOKMARKS_FILE" | wmenu -l 30)

# If nothing was selected, exit
[ -z "$selected" ] && exit

# Extract the URL from the selection
url=$(echo "$selected" | awk -F, '{print $3}')

# Prompt user to choose between browsers
browser=$(echo -e "librewolf\nbrave" | wmenu -l 2)

# If no browser is selected, exit
[ -z "$browser" ] && exit

# Execute the chosen browser directly with the URL
sh -c "$browser \"$url\" &"


