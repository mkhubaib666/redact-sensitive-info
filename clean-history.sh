#!/bin/bash

# === Configuration ===
REPO_URL="https://github.com/your-username/your-private-repo.git"  # <-- Replace with your actual repo URL
REPO_NAME="redact-sensitive-info"
PHONE_NUMBER="123-456-7890"
EMAIL="you@example.com"

# === Step 1: Clone the repository as a mirror ===
echo "[1/5] Cloning mirror of $REPO_URL..."
git clone --mirror "$REPO_URL" "$REPO_NAME.git"
cd "$REPO_NAME.git" || { echo "Repo clone failed"; exit 1; }

# === Step 2: Create the replacements list ===
echo "[2/5] Creating replacements file..."
cat <<EOF > replacements.txt
$PHONE_NUMBER==REDACTED_PHONE
$EMAIL==REDACTED_EMAIL
EOF

# === Step 3: Run git filter-repo ===
echo "[3/5] Scrubbing sensitive info with git filter-repo..."
git filter-repo --replace-text replacements.txt

# === Step 4: Push the cleaned history ===
echo "[4/5] Force-pushing cleaned repo back to GitHub..."
git remote set-url origin "$REPO_URL"
git push --force --all
git push --force --tags

# === Done ===
echo "[5/5] Cleanup complete. Repo is now clean."
