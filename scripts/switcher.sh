#!/bin/sh

# This script uses an optional environment variable $HYPR_BUILDIN_MON. If it is available, it is
# used to re-enable your display. Otherwise, the default setting ($DEFAULT_BUILDIN_ENABLE) is
# used.

BUILDIN_DISPLAY_NAME="eDP-1"  # Get the name of your buildin display using "hyprctl monitors all"
DEFAULT_BUILDIN_ENABLE="$BUILDIN_DISPLAY_NAME, highresxhighrr, 0x0, 1.5"

num_of_monitors=$(hyprctl monitors all | grep Monitor | wc -l)  # this might break in the future 
                                                                # or for different setups.

if [[ $num_of_monitors -gt 1 ]]; then
    # disable builtin monitor
    hyprctl keyword monitor "$BUILDIN_DISPLAY_NAME, disable"
else
    # re-enable buildin monitor
    if [[ -z "$HYPR_BUILDIN_MON" ]]; then
        # use default settings
        hyprctl keyword monitor "$DEFAULT_BUILDIN_ENABLE"
    else
        # use environment settings
        hyprctl keyword monitor "$HYPR_BUILDIN_MON"
    fi
fi
