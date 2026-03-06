cat > ~/scripts/claude_setup/scripts/claude_cloud.sh << 'EOF'
# Launch with Anthropic API
unset ANTHROPIC_BASE_URL
unset ANTHROPIC_AUTH_TOKEN
claude "$@"
EOF#launch with Anthropic API
