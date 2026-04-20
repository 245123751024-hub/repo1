#!/bin/bash
# StudReg GitHub Push Setup Script

echo "========================================="
echo "StudReg - GitHub Push Setup"
echo "========================================="
echo ""

# Check if git remote is configured
if git remote -v | grep -q "origin"; then
    echo "✓ Git remote already configured"
else
    echo "Setting up git remote..."
    git remote add origin https://github.com/245123751024-hub/repo1.git
fi

# Get GitHub PAT from user
echo ""
echo "To push to GitHub, you need a Personal Access Token (PAT)."
echo "Steps to generate PAT:"
echo "1. Go to https://github.com/settings/tokens"
echo "2. Click 'Generate new token (classic)'"
echo "3. Select scopes: repo (all), workflow, write:packages"
echo "4. Copy the token"
echo ""

read -sp "Enter your GitHub Personal Access Token: " GITHUB_PAT
echo ""

# Configure git credential helper
echo "Configuring Git with your token..."
git config credential.helper store

# Create credentials file
echo "https://245123751024-hub:${GITHUB_PAT}@github.com" > ~/.git-credentials
chmod 600 ~/.git-credentials

echo "✓ Credentials configured"
echo ""

# Push to GitHub
echo "Pushing to GitHub (main branch)..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✓ Successfully pushed to GitHub!"
    echo ""
    echo "Repository: https://github.com/245123751024-hub/repo1"
else
    echo "✗ Push failed. Please check:"
    echo "  - GitHub PAT is correct"
    echo "  - Repository exists and you have access"
    echo "  - Token has 'repo' scope enabled"
fi

echo "========================================="
