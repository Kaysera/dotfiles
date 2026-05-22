#!/bin/bash
sudo ln -sf ~/dotfiles/scripts/display-switcher/hypr-display-switcher.rules /etc/udev/rules.d/hypr-display-switcher.rules
sudo ln -sf ~/dotfiles/scripts/display-switcher/hypr-display-switcher.service /etc/systemd/user/hypr-display-switcher.service
