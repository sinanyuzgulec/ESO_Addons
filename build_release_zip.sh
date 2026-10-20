#!/bin/bash
# build_release_zip.sh
# Packages ARC_SetGlowGuard into an ESOUI/Minion ready ZIP archive

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$SCRIPT_DIR/dist"
ADDON_NAME="ARC_SetGlowGuard"
ZIP_NAME="${ADDON_NAME}.zip"

mkdir -p "$DIST_DIR"
rm -f "$DIST_DIR/$ZIP_NAME"

echo "Creating clean ESOUI / Minion distribution package..."

# Create temporary staging directory
STAGE_DIR=$(mktemp -d)
trap 'rm -rf "$STAGE_DIR"' EXIT

mkdir -p "$STAGE_DIR/$ADDON_NAME"

# Copy required addon files into package
cp "$SCRIPT_DIR/$ADDON_NAME/ARC_SetGlowGuard.txt" "$STAGE_DIR/$ADDON_NAME/"
cp "$SCRIPT_DIR/$ADDON_NAME/ARC_SetGlowGuard.addon" "$STAGE_DIR/$ADDON_NAME/"
cp "$SCRIPT_DIR/$ADDON_NAME/ARC_SetGlowGuardLocalization.lua" "$STAGE_DIR/$ADDON_NAME/"
cp "$SCRIPT_DIR/$ADDON_NAME/ARC_SetGlowGuardSettings.lua" "$STAGE_DIR/$ADDON_NAME/"
cp "$SCRIPT_DIR/$ADDON_NAME/ARC_SetGlowGuard.lua" "$STAGE_DIR/$ADDON_NAME/"
cp "$SCRIPT_DIR/$ADDON_NAME/README.md" "$STAGE_DIR/$ADDON_NAME/"

# Zip from stage dir so root folder is ARC_SetGlowGuard/
(cd "$STAGE_DIR" && python3 -c "
import zipfile, os
with zipfile.ZipFile('$DIST_DIR/$ZIP_NAME', 'w', zipfile.ZIP_DEFLATED) as z:
    for root, dirs, files in os.walk('$ADDON_NAME'):
        for f in files:
            p = os.path.join(root, f)
            z.write(p)
")

echo "✅ Package created successfully: $DIST_DIR/$ZIP_NAME"
echo "You can now directly upload this file to https://www.esoui.com/downloads/add.php"
