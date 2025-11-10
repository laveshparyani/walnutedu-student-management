#!/bin/bash

# Complete Git Setup and Push Script for Student Management App
# This script will initialize git, add remote, commit, and push to GitHub

# Don't exit on error - we'll handle errors gracefully

echo "=========================================="
echo "Git Setup and Push Script"
echo "=========================================="
echo ""

# Navigate to the script directory
cd "$(dirname "$0")"
PROJECT_DIR=$(pwd)
echo "Project directory: $PROJECT_DIR"
echo ""

# Step 1: Initialize git if not already initialized
if [ ! -d ".git" ]; then
    echo "Step 1: Initializing git repository..."
    git init
    echo "✓ Git repository initialized"
else
    echo "Step 1: Git repository already initialized"
fi
echo ""

# Step 2: Configure git user (skip if already configured)
echo "Step 2: Configuring git user..."
git config user.name "Lavesh Paryani" 2>/dev/null || echo "User name already configured"
git config user.email "laveshparyani01@gmail.com" 2>/dev/null || echo "User email already configured"
echo "✓ Git user configured"
echo ""

# Step 3: Add remote repository
echo "Step 3: Setting up remote repository..."
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/laveshparyani/walnutedu-student-management.git
echo "✓ Remote repository added: https://github.com/laveshparyani/walnutedu-student-management.git"
echo ""

# Step 4: Add all files
echo "Step 4: Adding files to git..."
git add .
echo "✓ All files added"
echo ""

# Step 5: Check status
echo "Step 5: Current git status:"
git status --short
echo ""

# Step 6: Commit changes
echo "Step 6: Committing changes..."
COMMIT_MESSAGE="Add comprehensive README with setup instructions, screenshots, challenges, and project documentation"

# Check if there are changes to commit
if [ -n "$(git status --porcelain)" ]; then
    git commit -m "$COMMIT_MESSAGE"
    echo "✓ Changes committed"
else
    # Check if there's at least one commit
    if [ -z "$(git log --oneline -1 2>/dev/null)" ]; then
        echo "No changes to commit, but creating initial commit..."
        git commit -m "$COMMIT_MESSAGE" --allow-empty
        echo "✓ Initial commit created"
    else
        echo "⚠ No new changes to commit (everything is already committed)"
    fi
fi
echo ""

# Step 7: Set branch to main
echo "Step 7: Setting branch to main..."
git branch -M main 2>/dev/null || echo "Branch is already main or doesn't exist yet"
echo "✓ Branch set to main"
echo ""

# Step 8: Push to GitHub
echo "Step 8: Pushing to GitHub..."
echo "⚠ You may be prompted for GitHub credentials"
echo ""
echo "If you encounter authentication issues:"
echo "1. Use a Personal Access Token (recommended)"
echo "2. Or set up SSH keys"
echo ""

# Try to push
echo "Attempting to push to GitHub..."
echo ""

# Push command
git push -u origin main
PUSH_EXIT_CODE=$?

if [ $PUSH_EXIT_CODE -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✓ Successfully pushed to GitHub!"
    echo "=========================================="
    echo ""
    echo "Repository URL: https://github.com/laveshparyani/walnutedu-student-management"
    echo ""
    echo "You can now view your repository at:"
    echo "https://github.com/laveshparyani/walnutedu-student-management"
    echo ""
else
    echo ""
    echo "=========================================="
    echo "⚠ Push encountered an issue"
    echo "=========================================="
    echo ""
    echo "Common issues and solutions:"
    echo ""
    echo "1. AUTHENTICATION REQUIRED:"
    echo "   - You'll need to authenticate with GitHub"
    echo "   - Use a Personal Access Token (recommended)"
    echo "   - Generate at: https://github.com/settings/tokens"
    echo "   - Select 'repo' scope"
    echo "   - Use the token as your password"
    echo ""
    echo "2. REPOSITORY ACCESS:"
    echo "   - Ensure you have write access to the repository"
    echo "   - Check repository URL is correct"
    echo ""
    echo "3. NETWORK ISSUES:"
    echo "   - Check your internet connection"
    echo "   - Verify GitHub is accessible"
    echo ""
    echo "To push manually, run:"
    echo "  git push -u origin main"
    echo ""
    exit $PUSH_EXIT_CODE
fi

