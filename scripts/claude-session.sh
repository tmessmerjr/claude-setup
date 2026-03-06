#!/bin/bash
# claude-session.sh - Save and recall named sessions
# Usage:
#   claude-session save "name"   - commit, tag, and push
#   claude-session recall "name" - pull and show session context
#   claude-session list          - list all saved sessions

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

notify_slack() {
    local text="$1"
    if [ -n "$SLACK_WEBHOOK_URL" ]; then
        local payload
        payload=$(printf '{"text":"%s"}' "$text")
        curl -s -X POST "$SLACK_WEBHOOK_URL" \
            -H 'Content-type: application/json' \
            --data-raw "$payload" >/dev/null 2>&1 || true
    fi
}

save_session() {
    local name="$1"
    if [ -z "$name" ]; then
        echo "Usage: claude-session save \"session name\""
        exit 1
    fi

    local tag="session/$(echo "$name" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')"
    local timestamp="$(date +%Y-%m-%d-%H%M)"

    cd "$PROJECT_DIR"
    git add -A
    git commit -m "session: $name ($timestamp)" --allow-empty
    git tag -f "$tag" -m "$name - $timestamp"
    git push
    git push origin "$tag" --force
    echo "Saved session: $name"
    echo "Tag: $tag"
    notify_slack "Session saved: $name [$(hostname) - $timestamp]"
}

recall_session() {
    local name="$1"
    if [ -z "$name" ]; then
        echo "Usage: claude-session recall \"session name\""
        echo ""
        echo "Available sessions:"
        list_sessions
        exit 0
    fi

    local tag="session/$(echo "$name" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')"

    cd "$PROJECT_DIR"
    git fetch --tags --force

    if ! git rev-parse "$tag" >/dev/null 2>&1; then
        echo "Session '$name' not found. Available sessions:"
        list_sessions
        exit 1
    fi

    echo "=== Session: $name ==="
    git tag -l "$tag" -n1
    echo ""
    echo "=== Changes in that session ==="
    git log "$tag" --oneline -5
    echo ""
    echo "=== Restoring to session state ==="
    git checkout "$tag" -- .
    echo "Files restored. Run 'git checkout main' when done to return to latest."
    notify_slack "Session recalled: $name [$(hostname) - $(date +%Y-%m-%d-%H%M)]"
}

list_sessions() {
    cd "$PROJECT_DIR"
    git fetch --tags --force 2>/dev/null
    local tags=$(git tag -l "session/*" --sort=-creatordate)
    if [ -z "$tags" ]; then
        echo "  (no saved sessions)"
        return
    fi
    echo "$tags" | while read -r tag; do
        local display_name="${tag#session/}"
        local msg=$(git tag -l "$tag" -n1 | sed "s/^$tag\s*//")
        printf "  %-30s %s\n" "$display_name" "$msg"
    done
}

case "${1:-}" in
    save)
        shift
        save_session "$*"
        ;;
    recall)
        shift
        recall_session "$*"
        ;;
    list)
        list_sessions
        ;;
    *)
        cat <<EOF
Usage: claude-session <command> [name]

Commands:
    save "name"     Save current state with a name
    recall "name"   Restore a saved session
    list            List all saved sessions

Examples:
    claude-session save "hpc debugging"
    claude-session recall "hpc debugging"
    claude-session list
EOF
        ;;
esac
