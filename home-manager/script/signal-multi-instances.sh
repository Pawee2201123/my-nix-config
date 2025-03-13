#!/bin/sh

# Define the working directory where your Signal instances are stored
working_dir="$HOME/.config"  # Change this if necessary

# Available instances to choose from
instances=("Signal-Account-1" "Signal-Account-2")

# Use wmenu to display the instances as a menu
instance=$(echo "${instances[@]}" | tr ' ' '\n' | wmenu -p "Select Signal instance:")

# Check if the user made a valid selection
if [[ -n $instance ]]; then
    echo "You chose: $instance"
    user_data_dir="$working_dir/$instance"
    
    # Ensure the directory exists
    mkdir -p "$user_data_dir"
    echo "Ensured directory exists: $user_data_dir"
    
    # Launch Signal with the selected user data directory
    echo "Launching Signal with user data directory: $user_data_dir"
    signal-desktop --user-data-dir="$user_data_dir"
else
    echo "No valid selection made, exiting."
fi

