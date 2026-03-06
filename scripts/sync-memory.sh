#!/bin/bash
# sync-memory.sh - Sync local memory with remote repository
# Usage: ./scripts/sync-memory.sh [pull|push|status]

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MEMORY_DIR="$PROJECT_DIR/memory"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if in git repository
check_git_repo() {
    if [ ! -d "$PROJECT_DIR/.git" ]; then
        print_error "Not in a git repository"
        exit 1
    fi
}

# Show status
show_status() {
    check_git_repo

    print_info "Memory directory status:"
    echo ""
    echo "Local changes:"
    git -C "$PROJECT_DIR" status --short memory/
    echo ""

    print_info "Uncommitted changes:"
    if [ -n "$(git -C "$PROJECT_DIR" diff --name-only memory/)" ]; then
        echo "✓ There are uncommitted changes in memory/"
    else
        echo "✓ No uncommitted changes"
    fi
    echo ""

    print_info "Remote status:"
    git -C "$PROJECT_DIR" fetch origin
    local local_commit=$(git -C "$PROJECT_DIR" rev-parse HEAD)
    local remote_commit=$(git -C "$PROJECT_DIR" rev-parse origin/main)
    if [ "$local_commit" = "$remote_commit" ]; then
        echo "✓ Up to date"
    else
        echo "⚠ Remote has newer changes"
    fi
}

# Pull changes from remote
pull_changes() {
    check_git_repo

    print_info "Pulling changes from remote..."

    # First, check for conflicts
    if [ -n "$(git -C "$PROJECT_DIR" diff --name-only memory/)" ]; then
        print_warn "You have uncommitted changes in memory/"
        read -p "Continue? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Aborted"
            exit 0
        fi
    fi

    # Pull changes
    if git -C "$PROJECT_DIR" pull --no-edit; then
        print_info "Changes pulled successfully"
        echo ""
        print_info "Memory files updated:"
        git -C "$PROJECT_DIR" diff --name-only HEAD~1 origin/main | grep memory/
    else
        print_error "Failed to pull changes"
        exit 1
    fi
}

# Push local changes to remote
push_changes() {
    check_git_repo

    if [ -z "$(git -C "$PROJECT_DIR" diff --name-only memory/)" ]; then
        print_info "No changes to push"
        exit 0
    fi

    print_info "Pushing changes to remote..."
    if git -C "$PROJECT_DIR" push; then
        print_info "Changes pushed successfully"
    else
        print_error "Failed to push changes"
        exit 1
    fi
}

# Show usage
show_usage() {
    cat << EOF
Usage: $0 [command]

Commands:
    status    Show memory directory status
    pull      Pull changes from remote
    push      Push local changes to remote

Examples:
    $0 status
    $0 pull
    $0 push

EOF
}

# Main execution
main() {
    case "${1:-status}" in
        status)
            show_status
            ;;
        pull)
            pull_changes
            ;;
        push)
            push_changes
            ;;
        *)
            show_usage
            exit 1
            ;;
    esac
}

main "$@"