#!/bin/bash
# Executes the appropriate application based on the URL provided (%U)

URL="$1"
MEET_APP_ID="kjgfgldnnfoeklkmfkjfagphfepbbdan"
CHROMIUM_EXEC="/usr/bin/chromium-browser"
# You may need to change the CHROMIUM_EXEC path if you use Google Chrome, e.g.,
# CHROMIUM_EXEC="/usr/bin/google-chrome-stable"


if [[ "$URL" == *meet.google.com/* ]]; then
    # Case 1: It's a Google Meet link.
    # Launch the dedicated PWA using its App ID.
    "${CHROMIUM_EXEC}" --app="$URL" & 
else
    # Case 2: It's any other link.
    # We must explicitly call a known web browser executable (not xdg-open)
    # to avoid recursion, and pass the URL to it.
    
    # NOTE: If your default browser is Firefox, change the line below to:
    # firefox "$URL" &
    
    # We will assume Chrome/Chromium is your secondary/default browser
    # that handles all non-Meet links:
    "${CHROMIUM_EXEC}" "$URL" &
fi
