#!/bin/bash

# This script uses an optional environment variable $HYPR_BUILDIN_MON. If it is available, it is
# used to re-enable your display. Otherwise, the default setting ($DEFAULT_BUILDIN_ENABLE) is
# used.

BUILDIN_DISPLAY_NAME="eDP-1"  # Get the name of your buildin display using "hyprctl monitors all"
DEFAULT_BUILDIN_ENABLE="$BUILDIN_DISPLAY_NAME, highresxhighrr, 0x0, 1.5"

LOG_FILE="/tmp/switcher.log"
log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$LOG_FILE"; }

# When triggered via udev/systemd, HYPRLAND_INSTANCE_SIGNATURE is not set.
# Look it up from the runtime directory so hyprctl can connect to the right socket.
if [[ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
    export HYPRLAND_INSTANCE_SIGNATURE=$(ls "$XDG_RUNTIME_DIR/hypr/" 2>/dev/null | head -1)
    log "Resolved HYPRLAND_INSTANCE_SIGNATURE: $HYPRLAND_INSTANCE_SIGNATURE"
fi

sleep 1  # wait for Hyprland to process the monitor change before querying
num_of_monitors=$(hyprctl monitors all | grep Monitor | wc -l)  # this might break in the future
                                                                # or for different setups.

if [[ $num_of_monitors -gt 1 ]]; then
    # disable builtin monitor
    log "Disabling built-in monitor ($BUILDIN_DISPLAY_NAME), $num_of_monitors monitors detected"
    log "Running: hyprctl keyword monitor \"$BUILDIN_DISPLAY_NAME, disable\""
    hyprctl keyword monitor "$BUILDIN_DISPLAY_NAME, disable"
else
    # re-enable buildin monitor
    if [[ -z "$HYPR_BUILDIN_MON" ]]; then
        # use default settings
        log "Re-enabling built-in monitor with default settings: $DEFAULT_BUILDIN_ENABLE"
        log "Running: hyprctl keyword monitor \"$DEFAULT_BUILDIN_ENABLE\""
        hyprctl keyword monitor "$DEFAULT_BUILDIN_ENABLE"
        hyprctl reload
    else
        # use environment settings
        log "Re-enabling built-in monitor with env settings: $HYPR_BUILDIN_MON"
        log "Running: hyprctl keyword monitor \"$HYPR_BUILDIN_MON\""
        hyprctl keyword monitor "$HYPR_BUILDIN_MON"
    fi
fi
