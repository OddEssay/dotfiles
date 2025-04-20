#!/bin/zsh

# Git Activity Tracker
# This script tracks the number of commits made today across multiple git repositories

# Configuration
# Add your repository paths here (space-separated)
REPOS=(
  "$HOME/development/patchwork/PatchworkOnRails"
  "$HOME/dotfiles"
  "$HOME/development/patchwork/PatchworkApps"
  # Add more repos as needed
)

# Get today's date in YYYY-MM-DD format
TODAY=$(date +%Y-%m-%d)

# Initialize counters
TOTAL_COMMITS=0
ACTIVE_REPOS=()

# Function to count commits for a specific branch
count_commits_in_branch() {
  local repo=$1
  local branch=$2
  local count=$(git -C "$repo" log --since="$TODAY 00:00:00" --until="$TODAY 23:59:59" --format=oneline "$branch" 2>/dev/null | wc -l | tr -d ' ')
  echo $count
}

# Process each repository
for REPO in "${REPOS[@]}"; do
  # Skip if directory doesn't exist or is not a git repository
  if [[ ! -d "$REPO/.git" ]]; then
    continue
  fi

  REPO_NAME=$(basename "$REPO")
  REPO_COMMITS=0
  
  # Get all local branches
  BRANCHES=($(git -C "$REPO" branch | sed 's/^[ *]*//' | tr '\n' ' '))
  
  # Also check main branch (might be main or master)
  if git -C "$REPO" rev-parse --verify main >/dev/null 2>&1; then
    MAIN_BRANCH="main"
  elif git -C "$REPO" rev-parse --verify master >/dev/null 2>&1; then
    MAIN_BRANCH="master"
  else
    MAIN_BRANCH=""
  fi
  
  # Count commits in main branch
  if [[ -n "$MAIN_BRANCH" ]]; then
    MAIN_COMMITS=$(count_commits_in_branch "$REPO" "$MAIN_BRANCH")
    REPO_COMMITS=$((REPO_COMMITS + MAIN_COMMITS))
    
    if [[ $MAIN_COMMITS -gt 0 ]]; then
      echo "Repo: $REPO_NAME, Branch: $MAIN_BRANCH, Commits today: $MAIN_COMMITS"
    fi
  fi
  
  # Count commits in other branches
  for BRANCH in "${BRANCHES[@]}"; do
    # Skip if it's the main branch we already counted
    if [[ "$BRANCH" == "$MAIN_BRANCH" ]]; then
      continue
    fi
    
    BRANCH_COMMITS=$(count_commits_in_branch "$REPO" "$BRANCH")
    REPO_COMMITS=$((REPO_COMMITS + BRANCH_COMMITS))
    
    if [[ $BRANCH_COMMITS -gt 0 ]]; then
      echo "Repo: $REPO_NAME, Branch: $BRANCH, Commits today: $BRANCH_COMMITS"
    fi
  done
  
  # Add to total if there were any commits
  if [[ $REPO_COMMITS -gt 0 ]]; then
    ACTIVE_REPOS+=("$REPO_NAME")
    TOTAL_COMMITS=$((TOTAL_COMMITS + REPO_COMMITS))
  fi
done

# Format the active repos list for output
REPOS_LIST=""
if [[ ${#ACTIVE_REPOS[@]} -gt 0 ]]; then
  for ((i=1; i<=${#ACTIVE_REPOS[@]}; i++)); do
    if [[ $i -eq ${#ACTIVE_REPOS[@]} ]]; then
      REPOS_LIST+="${ACTIVE_REPOS[$i]}"
    else
      REPOS_LIST+="${ACTIVE_REPOS[$i]}, "
    fi
  done
fi

# Output the summary
echo ""
echo "Summary for $TODAY:"
if [[ $TOTAL_COMMITS -eq 0 ]]; then
  echo "No commits made today."
else
  echo "$TOTAL_COMMITS commits today in: $REPOS_LIST"
fi
