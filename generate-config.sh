#!/usr/bin/env bash
set -euo pipefail

# Directory for generated JSON files
CONFIG_DIR="configs"
mkdir -p "$CONFIG_DIR"

# Function to write a JSON config file
write_config() {
  local file="$1"
  local test_backend="$2"
  local use_pkgdown="$3"
  local use_vignette="$4"
  local has_data="$5"

  cat > "$file" <<EOF
{
  "test_backend": "$test_backend",
  "use_pkgdown": $use_pkgdown,
  "use_vignette": $use_vignette,
  "has_data": $has_data,
  "user": "$USER",
  "home": "$HOME",
  "bin": "$HOME/bin",
  "path": "$PATH"
}
EOF
}

echo "Generating Kickstart config files in $CONFIG_DIR"

# --- Testthat combinations ---
write_config "$CONFIG_DIR/pkg1.json"  "testthat" true  true  true
write_config "$CONFIG_DIR/pkg2.json"  "testthat" false true  true
write_config "$CONFIG_DIR/pkg3.json"  "testthat" true  false true
write_config "$CONFIG_DIR/pkg4.json"  "testthat" false false false

# --- Tinytest combinations ---
write_config "$CONFIG_DIR/pkg5.json"  "tinytest" true  true  true
write_config "$CONFIG_DIR/pkg6.json"  "tinytest" false true  false
write_config "$CONFIG_DIR/pkg7.json"  "tinytest" true  false false
write_config "$CONFIG_DIR/pkg8.json"  "tinytest" false false true

# --- No tests combinations ---
write_config "$CONFIG_DIR/pkg9.json"  "none" true  true  true
write_config "$CONFIG_DIR/pkg10.json" "none" false true  false
write_config "$CONFIG_DIR/pkg11.json" "none" true  false false
write_config "$CONFIG_DIR/pkg12.json" "none" false false true

echo "Done."
