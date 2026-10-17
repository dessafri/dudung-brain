#!/usr/bin/env bash
# sync.sh — Pull terbaru dari dudung-brain dan override ke Hermes
# Jalankan dari folder repo: bash sync.sh
# Atau setelah git pull: bash sync.sh

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HERMES_HOME="$LOCALAPPDATA/hermes"

echo "[dudung-brain] Mulai sync ke Hermes..."
echo "  Repo  : $REPO_DIR"
echo "  Hermes: $HERMES_HOME"
echo ""

# 1. Git pull terbaru
echo "[1/4] git pull..."
git -C "$REPO_DIR" pull --ff-only
echo ""

# 2. SOUL.md → ~/.hermes/SOUL.md
echo "[2/4] Sync SOUL.md..."
cp "$REPO_DIR/soul/SOUL.md" "$HERMES_HOME/SOUL.md"
echo "  OK: SOUL.md → $HERMES_HOME/SOUL.md"
echo ""

# 3. Skills → ~/.hermes/skills/dudung/<name>/SKILL.md
echo "[3/4] Sync skills..."
SKILLS_DIR="$HERMES_HOME/skills/dudung"

declare -A SKILL_MAP=(
  ["dudung-brainstorm"]="skills/dudung-brainstorm.md"
  ["dudung-coding"]="skills/dudung-coding.md"
  ["dudung-riset"]="skills/dudung-riset.md"
  ["obsidian-vault"]="skills/obsidian-vault.md"
)

for skill_name in "${!SKILL_MAP[@]}"; do
  src="$REPO_DIR/${SKILL_MAP[$skill_name]}"
  dst="$SKILLS_DIR/$skill_name/SKILL.md"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  echo "  OK: $skill_name/SKILL.md"
done
echo ""

# 4. Context, Rules, Design → AGENTS.md di hermes home
echo "[4/4] Sync AGENTS.md (context + rules + design)..."
{
  echo "# Dudung Brain — Project Context"
  echo "# Auto-generated oleh sync.sh dari dudung-brain repo"
  echo "# Jangan edit manual — edit di repo lalu jalankan sync.sh"
  echo ""
  echo "---"
  echo ""
  cat "$REPO_DIR/context/USER_PROFILE.md"
  echo ""
  echo "---"
  echo ""
  cat "$REPO_DIR/context/TECH_STACK.md"
  echo ""
  echo "---"
  echo ""
  cat "$REPO_DIR/context/PROJECTS.md"
  echo ""
  echo "---"
  echo ""
  cat "$REPO_DIR/design/CLEAN_CODE.md"
  echo ""
  echo "---"
  echo ""
  cat "$REPO_DIR/rules/ANTI_SYCOPHANCY.md"
  echo ""
  echo "---"
  echo ""
  cat "$REPO_DIR/rules/RULES.md"
} > "$HERMES_HOME/AGENTS.md"
echo "  OK: AGENTS.md → $HERMES_HOME/AGENTS.md"
echo ""

echo "================================================"
echo "Sync selesai. Semua file Hermes sudah diupdate."
echo ""
echo "File yang di-update:"
echo "  $HERMES_HOME/SOUL.md"
echo "  $HERMES_HOME/AGENTS.md"
echo "  $HERMES_HOME/skills/dudung/dudung-brainstorm/SKILL.md"
echo "  $HERMES_HOME/skills/dudung/dudung-coding/SKILL.md"
echo "  $HERMES_HOME/skills/dudung/dudung-riset/SKILL.md"
echo "  $HERMES_HOME/skills/dudung/obsidian-vault/SKILL.md"
echo "================================================"
