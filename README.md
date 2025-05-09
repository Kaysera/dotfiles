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

## Look and feel
### Desktop
![image](https://github.com/user-attachments/assets/356a84fc-6cb2-44ce-9317-c986d37173ce)

### Terminal
![image](https://github.com/user-attachments/assets/50ef0c8a-68a6-4a6a-8284-b8cc6e6503d9)

### IDE
![image](https://github.com/user-attachments/assets/aa4a019c-d89d-4f03-ab13-b0797f5f5773)

### Web Browser
![image](https://github.com/user-attachments/assets/af88d280-2785-48a4-9228-ee66be85dd76)





