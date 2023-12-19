#!/bin/bash

# This script works and does what I want it to! I changed this line by adding this sentence for testing!

# Set the names of your monitors
laptop_monitor="LVDS-1"
external_monitor="VGA-1"

# Get the current primary display
current_primary=$(xrandr --listmonitors | grep '*' | awk '{print $4}')

# Print current state
echo "Current Primary Monitor: $current_primary"

# Determine the non-primary monitor
if [ "$current_primary" = "$laptop_monitor" ]; then
    non_primary_monitor="$external_monitor"
else
    non_primary_monitor="$laptop_monitor"
fi

# Turn off the current primary monitor
xrandr --output $current_primary --off

# Power on and set the non-primary monitor as primary
xrandr --output $non_primary_monitor --auto --primary

# Get the updated state of the primary monitor
updated_primary=$(xrandr --listmonitors | grep '*' | awk '{print $4}')

# Print updated state
echo "Updated Primary Monitor: $updated_primary"
