#!/usr/bin/env bash
set -euo pipefail

VERSION="v0.6.0"

if [[ "$RUNNER_OS" == "Linux" ]]; then
  FILE="kickstart-${VERSION}-x86_64-unknown-linux-gnu.tar.gz"
elif [[ "$RUNNER_OS" == "macOS" ]]; then
  FILE="kickstart-${VERSION}-x86_64-apple-darwin.tar.gz"
else
  FILE="kickstart-${VERSION}-x86_64-pc-windows-msvc.zip"
fi

URL="https://github.com/Keats/kickstart/releases/download/${VERSION}/${FILE}"

if [[ "$RUNNER_OS" == "Windows" ]]; then
  curl -L "$URL" -o kickstart_archive.zip
else
  curl -L "$URL" -o kickstart_archive
fi

if [[ "$RUNNER_OS" == "Windows" ]]; then
  powershell -Command "Expand-Archive -Path kickstart_archive.zip -DestinationPath ."
  echo "$GITHUB_WORKSPACE" >> $GITHUB_PATH
else
  tar -xzf kickstart_archive
  chmod +x kickstart
  echo "$GITHUB_WORKSPACE" >> $GITHUB_PATH
fi
