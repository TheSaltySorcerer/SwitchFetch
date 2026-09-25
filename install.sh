#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/neofetch"
timestamp="$(date +%Y%m%d-%H%M%S)"

if [[ "${1:-}" != "" && "${1:-}" != "--autostart" ]]; then
    printf 'Usage: %s [--autostart]\n' "$0" >&2
    exit 2
fi

mkdir -p "$config_dir"
for name in config.conf nx-ascii; do
    if [[ -e "$config_dir/$name" ]]; then
        cp -a -- "$config_dir/$name" "$config_dir/$name.bak.$timestamp"
    fi
done

install -m 0644 "$script_dir/config.conf" "$config_dir/config.conf"
install -m 0644 "$script_dir/nx-ascii" "$config_dir/nx-ascii"

if ! command -v neofetch >/dev/null 2>&1; then
    printf 'Theme installed. Install Neofetch before running it.\n'
else
    printf 'Theme installed in %s\n' "$config_dir"
fi

if [[ "${1:-}" == "--autostart" ]]; then
    bashrc="$HOME/.bashrc"
    marker='# NX-Switch Neofetch autostart'
    if ! grep -Fq "$marker" "$bashrc" 2>/dev/null; then
        cat >> "$bashrc" <<'EOF'

# NX-Switch Neofetch autostart
if [[ $- == *i* ]] && command -v neofetch >/dev/null 2>&1; then
    neofetch
fi
EOF
    fi
    printf 'Interactive Bash auto-start enabled in %s\n' "$bashrc"
fi
