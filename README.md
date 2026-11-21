# Tray icons

GNOME Shell 50 extension that hides the tray icons in the top bar from a Quick Settings toggle, with exceptions for the
apps whose icon should stay.

## Features

- Turning the **Tray icons** toggle in Quick Settings on hides every tray icon, and the Accessibility menu, while apps
  keep running. Turn it off to show them again.
- The toggle's arrow opens a list of the icons in the top bar. Check an app to keep its icon visible while the others
  are hidden. Several can be checked without the menu closing.
- Exceptions are remembered while an app is closed, and apply again when it comes back. The list only shows apps that
  are running.
- Draws its own icon for some apps instead of theirs: Filee (`filee-tray.svg`) and Beeper (`beeper-tray.svg`). To add
  one, put a white SVG next to `extension.js` and add the app to `CUSTOM_ICONS` there.

Its state (hidden or shown, and the exceptions) is saved in `~/.config/filee-tray-toggle/state.json`.

## Requirements

- GNOME Shell 50
- The AppIndicator extension, which shows tray icons in the top bar. Ubuntu has it built in.

## Install

```sh
git clone https://github.com/cyborgcode/tray-icons.git
cd tray-icons
./install.sh
```

The installer copies the extension to `~/.local/share/gnome-shell/extensions/filee-tray-toggle@local` and enables it.
Log out and back in to load it. After editing the extension, run `./install.sh` again and log out and back in.

`./uninstall.sh` turns it off and removes it with its saved state.

## License

GPL-3.0-or-later. See [LICENSE](LICENSE).
