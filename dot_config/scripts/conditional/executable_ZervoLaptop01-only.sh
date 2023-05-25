#!/bin/bash

# Laptop startcommands!
# This script acts as an extension to the i3 config, that only runs
# if the system is defined as a laptop (by defining env islaptop).

# Check if laptop
if [[ "$HOST" == "ZervoLaptop01" ]]; then
    echo "Hostname mismatch, is not laptop"
    exit
else
    echo "Identified as laptop, continuing."
fi

# Enable Touchpad Click-on-Tap
xinput set-prop 9 "libinput Scroll Method Enabled" 1 0 0
echo "enabled touchpad scrolling"
xinput set-prop 9 "libinput Tapping Enabled" 1
echo "enabled touchpad tapping"
