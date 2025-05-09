# Dotfiles Repo

This repo manages my dotfiles, proceed with caution!!

## Programs

- Window Manager: [Hyprland](https://hyprland.org/)
- Status Bar: [HyprPanel](https://hyprpanel.com/)
- Application Runner: [Wofi](https://hg.sr.ht/~scoopta/wofi)
- Terminal Emulator: [Ghostty](https://ghostty.org/)
- Shell: [zsh](https://en.wikipedia.org/wiki/Z_shell)
- Shell plugin manager: [Antidote](https://github.com/mattmc3/antidote)
- Shell prompt: [Starship](https://starship.rs/)
- Color scheme: [Catppuccin Mocha](https://catppuccin.com/)
- Text editor: [NeoVim](https://github.com/neovim/neovim), [VSCodium](https://vscodium.com/)
- Web Browser: [Zen Browser](https://zen-browser.app/)

## Installation

The install scripts are located under the `/fedora` folder, and have been tested with Fedora Workstation 42. They can be executed in any order, except for `hyprpanel` which depends on `astal` and `ags` (in this order).

## Configuration

The configuration files are located in `/stow` and are managed using [GNU Stow](https://www.gnu.org/software/stow/), which automatically manages the symlinks. 

In order to link any configuration, run

```bash
stow <program> -t ~
```

