#!/usr/bin/env bash

OUTPUT="site-code-export.txt"

{
  echo "FRD WEBSITE CODE EXPORT"
  echo "Generated: $(date)"
  echo

  echo "=================================================="
  echo "REPO STRUCTURE"
  echo "=================================================="
  find . \
    -path "./node_modules" -prune -o \
    -path "./.git" -prune -o \
    -path "./dist" -prune -o \
    -path "./.astro" -prune -o \
    -path "./.vscode" -prune -o \
    -print | sed 's#^\./##'
  echo
  echo

  for f in astro.config.mjs package.json package-lock.json tsconfig.json .env README.md; do
    if [ -f "$f" ]; then
      echo "=================================================="
      echo "FILE: $f"
      echo "=================================================="
      cat "$f"
      echo
      echo
    fi
  done

  find src \
    \( -name "*.astro" -o -name "*.css" -o -name "*.js" -o -name "*.mjs" -o -name "*.ts" -o -name "*.json" -o -name "*.md" \) \
    -type f | sort | while read -r f; do
      echo "=================================================="
      echo "FILE: $f"
      echo "=================================================="
      cat "$f"
      echo
      echo
    done

  find public \
    \( -name "*.svg" -o -name "*.txt" -o -name "*.webmanifest" -o -name "*.xml" \) \
    -type f | sort | while read -r f; do
      echo "=================================================="
      echo "FILE: $f"
      echo "=================================================="
      cat "$f"
      echo
      echo
    done

} > "$OUTPUT"

echo "Exported to $OUTPUT"
