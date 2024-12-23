#!/bin/bash
# This script configures the projector as a second screen mirroring the primary display.
# Ensure xrandr is installed: sudo apt-get install xrandr (Debian/Ubuntu) or sudo pacman -S xorg-xrandr (Arch).

# Check if xrandr is installed
# This script configures a projector display using xrandr.
# It first checks if xrandr is installed, and if not, it prompts the user to install it and exits.
# If xrandr is installed, it sets the projector display to mirror the primary display.
# After attempting to configure the projector, it checks if the xrandr command was successful.


# Change the PRIMARY_DISPLAY and PROJECTOR_DISPLAY according to the output of your xrandr command.
if ! command -v xrandr &> /dev/null; then
    echo "xrandr is not installed. Please install it and try again."
    exit 1
fi

# Configure the projector
PRIMARY_DISPLAY="eDP-1"
PROJECTOR_DISPLAY="HDMI-1"

xrandr --output $PROJECTOR_DISPLAY --same-as $PRIMARY_DISPLAY

# The condition [$? -eq 0] checks if the previous command (xrandr) executed successfully.
# $? is a special variable that holds the exit status of the last executed command.
# An exit status of 0 indicates success, while any other value indicates failure.
# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Projector configured successfully."
else
    echo "Failed to configure the projector."
    exit 1
fi