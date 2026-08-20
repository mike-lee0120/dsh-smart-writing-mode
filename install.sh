#!/usr/bin/env bash
# Install the `writing` agent preset into the harness user root.
set -euo pipefail

PRESET_ID="writing"
DSH_HOME="${DSH_HOME:-$HOME/.dsh}"
DEST="$DSH_HOME/.agent-presets/$PRESET_ID"
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$DEST"

# Copy everything except version-control and install metadata.
rsync -a --delete \
  --exclude '.git' \
  --exclude 'install.sh' \
  --exclude 'README*.md' \
  "$SRC/" "$DEST/"

# Owner-only, matching the roster's own `copy()` tightening.
chmod -R u=rwX,go= "$DEST"

echo "Installed preset '$PRESET_ID' -> $DEST"
echo "Start a new session and pick '智能写作模式' from the mode picker."
