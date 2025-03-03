#!/bin/sh

# Directory where you want to save screenshots (can be modified)
SAVE_DIR="$HOME/pic/screenshot"

# Make sure the directory exists
mkdir -p "$SAVE_DIR"

# Function to send notifications using mako
send_notification() {
    local message=$1
    # Use mako's notification system (works via DBus or can be called directly)
    notify-send "$message"
}

# Function to take a full-screen screenshot and save to the specified directory
screenshot_full_save() {
    filename="$(date +'%Y-%m-%d_%H-%M-%S').png"
    grim "$SAVE_DIR/$filename"
    send_notification "Full-screen screenshot saved to $SAVE_DIR/$filename"
}

# Function to take a full-screen screenshot and copy to clipboard
screenshot_full_clipboard() {
    grim - | wl-copy
    send_notification "Full-screen screenshot copied to clipboard"
}

# Function to take a partial screenshot and save to the specified directory
screenshot_partial_save() {
    filename="$(date +'%Y-%m-%d_%H-%M-%S').png"
    grim -g "$(slurp -d)" "$SAVE_DIR/$filename"
    send_notification "Partial screenshot saved to $SAVE_DIR/$filename"
}

# Function to take a partial screenshot and copy to clipboard
screenshot_partial_clipboard() {
    grim -g "$(slurp -d)" - | wl-copy
    send_notification "Partial screenshot copied to clipboard"
}

# Parse the flags using getopts
while getopts "cdpf" opt; do
    case $opt in
        c)
            clipboard=true
            ;;
        d)
            directory=true
            ;;
        p)
            partial=true
            ;;
        f)
            fullscreen=true
            ;;
        *)
            echo "Invalid option."
            exit 1
            ;;
    esac
done

# Ensure that either -f or -p is set
if [[ -z "$fullscreen" && -z "$partial" ]]; then
    echo "Error: You must specify either -f (fullscreen) or -p (partial)."
    exit 1
fi

# Take the screenshot based on the flags
if [[ "$fullscreen" == true && "$directory" == true ]]; then
    screenshot_full_save
elif [[ "$fullscreen" == true && "$clipboard" == true ]]; then
    screenshot_full_clipboard
elif [[ "$partial" == true && "$directory" == true ]]; then
    screenshot_partial_save
elif [[ "$partial" == true && "$clipboard" == true ]]; then
    screenshot_partial_clipboard
else
    echo "Error: Invalid combination of flags."
    exit 1
fi

