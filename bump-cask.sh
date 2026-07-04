#!/bin/zsh
# Bumps a cask in this tap to a new version: downloads the release asset,
# recomputes the sha256, updates the cask file, commits, and pushes.
#
# Usage: ./bump-cask.sh <cask> <version>
#   e.g. ./bump-cask.sh keytype 1.2.0
#
# Run after publishing the GitHub release the cask points at.
set -euo pipefail
cd "$(dirname "$0")"

CASK_NAME=${1:?usage: bump-cask.sh <cask> <version>}
NEW_VERSION=${2:?usage: bump-cask.sh <cask> <version>}
CASK="Casks/${CASK_NAME}.rb"
[ -f "$CASK" ] || { echo "No such cask: $CASK" >&2; exit 1; }

URL_TEMPLATE=$(grep -E '^\s*url "' "$CASK" | sed -E 's/.*url "([^"]+)".*/\1/')
URL=${URL_TEMPLATE//\#\{version\}/$NEW_VERSION}

echo "==> Downloading ${URL}"
TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT
curl -fsSL "$URL" -o "$TMP"
SHA=$(shasum -a 256 "$TMP" | awk '{print $1}')

sed -i '' -E "s|^(  version \").*(\")$|\1${NEW_VERSION}\2|" "$CASK"
sed -i '' -E "s|^(  sha256 \").*(\")$|\1${SHA}\2|" "$CASK"

if git diff --quiet "$CASK"; then
    echo "Cask already at ${NEW_VERSION} with matching sha256 — nothing to do."
    exit 0
fi

git add "$CASK"
git commit -m "${CASK_NAME} ${NEW_VERSION}"
git push
echo "Done: ${CASK_NAME} -> ${NEW_VERSION}"
