#!/bin/bash

# Git Setup Script for Student Management App
# This script initializes git, adds remote, and prepares for push

echo "Setting up Git repository for Student Management App..."

# Navigate to the app directory
cd "$(dirname "$0")"

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
fi

# Configure git user (if not already configured)
# Uncomment and modify these lines if needed:
# git config user.name "Lavesh Paryani"
# git config user.email "laveshparyani01@gmail.com"

# Add remote repository
echo "Adding remote repository..."
git remote remove origin 2>/dev/null
git remote add origin https://github.com/laveshparyani/walnutedu-student-management.git

# Add all files
echo "Adding files to git..."
git add .

# Check status
echo "Git status:"
git status

echo ""
echo "Setup complete! Next steps:"
echo "1. Review the changes: git status"
echo "2. Commit the changes: git commit -m 'Add comprehensive README and project files'"
echo "3. Push to GitHub: git push -u origin main"
echo ""
echo "Note: If the branch is named 'master' instead of 'main', use: git push -u origin master"
echo "      You may need to set the upstream branch: git branch -M main"

