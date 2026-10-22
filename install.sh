#!/usr/bin/env bash
# Sets up what this repo needs that doesn't come with a clone:
#   - checks for LilyPond 2.26+ and python3 (installs neither)
#   - VS Code: VSLilyPond Plus (latest GitHub release) and the extensions it uses
#   - the private `files` submodule, if you have access
#   - with --fonts: copies the LV GoldenAge music font into LilyPond's font folder
#
# Usage: ./install.sh [--fonts] [--dry-run]
set -uo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONT_DIR="$REPO_DIR/templates/fonts/lv-goldenage"
EXT_ID="wwrinkle.vslilypond-plus"
EXT_RELEASES="https://api.github.com/repos/wwrinkle/VSLilyPond-Plus/releases/latest"
EXT_DEPS=(jeandeaual.lilypond-syntax lhl2617.lilypond-snippets)
# replaced by VSLilyPond Plus (the formatter's format-on-save overwrites unsaved edits;
# the PDF preview is built in since 1.11.0)
EXT_CONFLICTS=(lhl2617.vslilypond lhl2617.lilypond-formatter lhl2617.lilypond-pdf-preview)
MIN_LILYPOND="2.26.0"

INSTALL_FONTS=false
DRY_RUN=false
for arg in "$@"; do
  case "$arg" in
    --fonts) INSTALL_FONTS=true ;;
    --dry-run) DRY_RUN=true ;;
    -h | --help) sed -n '2,9p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $arg (see --help)" >&2; exit 2 ;;
  esac
done

ok() { printf '  \033[32m✓\033[0m %s\n' "$*"; }
warn() { printf '  \033[33m!\033[0m %s\n' "$*"; WARNINGS=$((WARNINGS + 1)); }
step() { printf '\n\033[1m%s\033[0m\n' "$*"; }
run() {
  if $DRY_RUN; then printf '    [dry run] %s\n' "$*"; else "$@"; fi
}
version_ge() { [ "$(printf '%s\n%s\n' "$2" "$1" | sort -V | head -n1)" = "$2" ]; }
WARNINGS=0

# ---------------------------------------------------------------- LilyPond
step "LilyPond"
LILYPOND_VERSION=""
if command -v lilypond >/dev/null 2>&1; then
  LILYPOND_VERSION="$(lilypond --version 2>/dev/null | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -n1)"
  if version_ge "$LILYPOND_VERSION" "$MIN_LILYPOND"; then
    ok "lilypond $LILYPOND_VERSION ($(command -v lilypond))"
  else
    warn "lilypond $LILYPOND_VERSION found; the templates need $MIN_LILYPOND or newer: https://lilypond.org/download.html"
  fi
else
  warn "lilypond not found on PATH. Install $MIN_LILYPOND or newer: https://lilypond.org/download.html"
fi

# ---------------------------------------------------------------- python3
step "Python (format on save)"
if command -v python3 >/dev/null 2>&1; then
  ok "$(python3 --version 2>&1)"
else
  warn "python3 not found; VSLilyPond Plus needs it to format on save (python-ly itself is bundled)"
fi

# ---------------------------------------------------------------- VS Code
step "VS Code extensions"
if ! command -v code >/dev/null 2>&1; then
  warn "VS Code's 'code' command not found; skipping extensions (VS Code: Shell Command: Install 'code' command in PATH)"
else
  INSTALLED="$(code --list-extensions --show-versions 2>/dev/null)"
  installed_version() { printf '%s\n' "$INSTALLED" | grep -i "^$1@" | head -n1 | cut -d@ -f2; }

  for ext in "${EXT_DEPS[@]}"; do
    if [ -n "$(installed_version "$ext")" ]; then
      ok "$ext"
    else
      echo "  installing $ext"
      run code --install-extension "$ext" >/dev/null && ok "$ext"
    fi
  done

  # VSLilyPond Plus isn't on the Marketplace: install the .vsix from the latest release
  RELEASE_JSON="$(curl -fsSL "$EXT_RELEASES" 2>/dev/null || true)"
  VSIX_URL="$(printf '%s' "$RELEASE_JSON" | grep -oE '"browser_download_url": *"[^"]+\.vsix"' | head -n1 | sed -E 's/.*"(https[^"]+)"/\1/')"
  LATEST="$(printf '%s' "$VSIX_URL" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | tail -n1)"
  CURRENT="$(installed_version "$EXT_ID")"
  if [ -z "$VSIX_URL" ]; then
    if [ -n "$CURRENT" ]; then
      warn "couldn't check for VSLilyPond Plus updates (offline?); keeping $CURRENT"
    else
      warn "couldn't download VSLilyPond Plus; get the .vsix from https://github.com/wwrinkle/VSLilyPond-Plus/releases/latest"
    fi
  elif [ -n "$CURRENT" ] && version_ge "$CURRENT" "$LATEST"; then
    ok "$EXT_ID $CURRENT (latest release: $LATEST)"
  else
    echo "  installing $EXT_ID $LATEST"
    TMP_DIR="$(mktemp -d)"
    trap 'rm -rf "$TMP_DIR"' EXIT
    if run curl -fsSL -o "$TMP_DIR/vslilypond-plus.vsix" "$VSIX_URL" &&
      run code --install-extension "$TMP_DIR/vslilypond-plus.vsix" >/dev/null; then
      ok "$EXT_ID $LATEST (reload VS Code windows to use it)"
    else
      warn "installing $EXT_ID failed"
    fi
  fi

  # after the upgrade: VSLilyPond Plus before 1.11.0 depends on the old PDF preview
  for ext in "${EXT_CONFLICTS[@]}"; do
    if [ -n "$(installed_version "$ext")" ]; then
      echo "  removing $ext (replaced by VSLilyPond Plus)"
      run code --uninstall-extension "$ext" >/dev/null 2>&1 ||
        warn "couldn't remove $ext; uninstall it in VS Code"
    fi
  done
fi

# ---------------------------------------------------------------- private scores
step "Private scores (files/)"
if [ -f "$REPO_DIR/.gitmodules" ] && grep -q 'path = files' "$REPO_DIR/.gitmodules"; then
  if [ -e "$REPO_DIR/files/.git" ]; then
    ok "files/ already checked out"
  elif $DRY_RUN; then
    echo "    [dry run] git submodule update --init files"
  elif git -C "$REPO_DIR" -c core.askPass=true submodule update --init files >/dev/null 2>&1; then
    ok "files/ checked out"
  else
    ok "files/ is private; skipped (examples/ has public examples)"
  fi
fi

# ---------------------------------------------------------------- music font (optional)
step "LV GoldenAge music font"
if $INSTALL_FONTS; then
  if [ -z "$LILYPOND_VERSION" ]; then
    warn "--fonts needs lilypond on PATH"
  else
    PREFIX="$(lilypond -e '(begin (display (ly:effective-prefix)) (exit 0))' 2>/dev/null | tail -n1)"
    OTF_DIR="$PREFIX/fonts/otf"
    if [ ! -d "$OTF_DIR" ]; then
      warn "couldn't find LilyPond's font folder (got '$OTF_DIR')"
    elif [ -w "$OTF_DIR" ]; then
      run cp "$FONT_DIR"/lv-goldenage-*.otf "$OTF_DIR"/ && ok "copied into $OTF_DIR"
    else
      warn "no write access to $OTF_DIR; run: sudo cp \"$FONT_DIR\"/lv-goldenage-*.otf \"$OTF_DIR\"/"
    fi
  fi
else
  ok "VS Code finds it via the repo settings; on the command line use: lilypond -I templates/fonts/lv-goldenage ..."
  echo "    (or rerun with --fonts to copy it into LilyPond so -I isn't needed)"
fi

echo
if [ "$WARNINGS" -eq 0 ]; then
  printf '\033[32mDone.\033[0m\n'
else
  printf '\033[33mDone with %d warning(s).\033[0m\n' "$WARNINGS"
fi
