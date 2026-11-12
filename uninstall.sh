#!/bin/sh
# Turns the extension off and removes it, with its saved state (whether icons are hidden, and the exceptions).
set -eu

cd "$(dirname "$0")"

uuid=$(python3 -c 'import json; print(json.load(open("metadata.json"))["uuid"])')
dest="${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions/$uuid"

enabled=$(gsettings get org.gnome.shell enabled-extensions)
remaining=$(python3 -c '
import ast, sys
uuids = ast.literal_eval(sys.argv[1].removeprefix("@as "))
print("[" + ", ".join(repr(u) for u in uuids if u != sys.argv[2]) + "]")' "$enabled" "$uuid")
gsettings set org.gnome.shell enabled-extensions "$remaining"
rm -rf "$dest" "${XDG_CONFIG_HOME:-$HOME/.config}/filee-tray-toggle"
echo "Removed $uuid. Log out and back in to finish: GNOME Shell keeps it running until then."
