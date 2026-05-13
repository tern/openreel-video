#!/bin/bash

# Configuration
UPSTREAM_URL="https://github.com/Augani/openreel-video.git"
MAIN_BRANCH="main"
DESKTOP_BRANCH="desktop-main"

# 1. Add upstream if it doesn't exist
if ! git remote | grep -q upstream; then
    echo "Adding upstream remote..."
    git remote add upstream $UPSTREAM_URL
fi

# 2. Fetch latest changes
echo "Fetching from upstream..."
git fetch upstream

# 3. Check for updates
UPSTREAM_HEAD=$(git rev-parse upstream/$MAIN_BRANCH)
LOCAL_UPSTREAM_SYNC=$(git merge-base $MAIN_BRANCH upstream/$MAIN_BRANCH)

if [ "$UPSTREAM_HEAD" = "$LOCAL_UPSTREAM_SYNC" ]; then
    echo "Already up to date with upstream."
else
    echo "Upstream has new changes. To sync, run:"
    echo "  git checkout $MAIN_BRANCH"
    echo "  git pull upstream $MAIN_BRANCH"
    echo "  git checkout $DESKTOP_BRANCH"
    echo "  git merge $MAIN_BRANCH"
fi
