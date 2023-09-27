#!/bin/bash

# Define the username and script path
USERNAME="luna"
SCRIPT_PATH="/home/luna/uur.sh"

# Check if the user exists
if id "$USERNAME" &>/dev/null; then
    # Create the uur.sh file with the specified content
    cat <<EOL > "$SCRIPT_PATH"
#!/bin/bash

# Update the package list
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Restart the system
sudo reboot
EOL

    # Make the script executable
    chmod +x "$SCRIPT_PATH"

    # Add the sudoers entry for the script without requiring a password
    echo "$USERNAME ALL=(ALL) NOPASSWD: $SCRIPT_PATH" | sudo EDITOR='tee -a' visudo

    # Create a cron job for the script to run every week (adjust timing as needed)
    (crontab -l -u $USERNAME; echo "0 0 * * 0 $SCRIPT_PATH") | sort - | uniq - | crontab -u $USERNAME -

    # Output a message
    echo "Sudo privileges added for $USERNAME to run $SCRIPT_PATH."
    echo "Cron job scheduled to run $SCRIPT_PATH every week."
else
    echo "User $USERNAME does not exist."
fi
