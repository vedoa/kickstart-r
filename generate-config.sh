#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="configs"
mkdir -p "$CONFIG_DIR"

write_config() {
  local file="$1"
  local test_backend="$2"
  local use_pkgdown="$3"
  local use_vignette="$4"
  local has_data="$5"
  local ci_backend="$6"

  cat > "$file" <<EOF
{
  "test_backend": "$test_backend",
  "use_pkgdown": $use_pkgdown,
  "use_vignette": $use_vignette,
  "has_data": $has_data,
  "ci_backend": "$ci_backend",
  "package_name": "mypkg",
  "package_title": "My Package",
  "package_description": "Example",
  "author_name": "Test User",
  "author_email": "test@example.com",
  "license": "MIT + file LICENSE",
  "repo_url": "https://example.com"
}
EOF
}

echo "Generating Kickstart config files in $CONFIG_DIR"

i=1
for test_backend in none testthat tinytest; do
  for use_pkgdown in true false; do
    for use_vignette in true false; do
      for has_data in true false; do
        for ci_backend in none github gitlab jenkins; do

          file="$CONFIG_DIR/pkg${i}.json"
          write_config "$file" "$test_backend" "$use_pkgdown" "$use_vignette" "$has_data" "$ci_backend"

          echo "Generated $file"
          i=$((i+1))

        done
      done
    done
  done
done

echo "Done. Total configs: $((i-1))"
