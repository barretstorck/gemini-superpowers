#!/usr/bin/env bash
# SessionStart hook for gemini-superpowers extension

set -euo pipefail

# Determine extension root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
EXTENSION_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Read using-superpowers content
SKILL_PATH="${EXTENSION_ROOT}/skills/using-superpowers/SKILL.md"
if [ ! -f "$SKILL_PATH" ]; then
    echo "Error: using-superpowers skill not found at $SKILL_PATH" >&2
    exit 1
fi

using_superpowers_content=$(cat "$SKILL_PATH")

# Escape outputs for JSON using pure bash
escape_for_json() {
    local input="$1"
    local output=""
    local i char
    for (( i=0; i<${#input}; i++ )); do
        char="${input:$i:1}"
        case "$char" in
            '\') output+='\\' ;; # Corrected: escaped backslash
            '"') output+='\"' ;; # Corrected: escaped double quote
            $'\n') output+='\n' ;; # Corrected: escaped newline
            $'') output+='\r' ;; # Corrected: escaped carriage return
            $'	') output+='\t' ;; # Corrected: escaped tab
            *) output+="$char" ;; # No change needed for other characters
        esac
    done
    printf '%s' "$output"
}

using_superpowers_escaped=$(escape_for_json "$using_superpowers_content")

# Output context injection as JSON
cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "<EXTREMELY_IMPORTANT>\nYou have superpowers.\n\n**Below is the full content of your 'superpowers:using-superpowers' skill - your introduction to using skills. For all other skills, use the 'activate_skill' tool:**\n\n${using_superpowers_escaped}\n</EXTREMELY_IMPORTANT>"
  }
}
EOF

exit 0
