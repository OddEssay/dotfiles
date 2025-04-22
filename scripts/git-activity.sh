#!/bin/zsh

# Git Activity Tracker
# This script tracks the number of commits made today by the current user across multiple git repositories

# Configuration
# Add your repository paths here (space-separated)
REPOS=(
  "$HOME/dotfiles"
  "$HOME/patchwork/PatchworkOnRails"
  "$HOME/patchwork/PatchworkApps"
  "$HOME/patchwork/L2P-V8"
  # Add more repos as needed
)

AUTHOR_NAME="Paul Bennett-Freeman"


# Get today's date in YYYY-MM-DD format
TODAY=$(date +%Y-%m-%d)

# Initialize counters
TOTAL_COMMITS=0
ACTIVE_REPOS=()

# Function to collect commit SHAs for a specific branch, filtered by multiple authors
collect_commit_shas_in_branch() {
  local repo=$1
  local branch=$2
  local author_pattern=""
  
  # Output commit SHAs
  if [[ -n "$author_pattern" ]]; then
    git -C "$repo" log --since="$TODAY 00:00:00" --until="$TODAY 23:59:59" --author="$AUTHOR_NAME" --format="%H" "$branch" 2>/dev/null
  else
    # Fallback if no author identity could be determined
    git -C "$repo" log --since="$TODAY 00:00:00" --until="$TODAY 23:59:59" --format="%H" "$branch" 2>/dev/null
  fi
}



# Process each repository
for REPO in "${REPOS[@]}"; do
  # Skip if directory doesn't exist or is not a git repository
  if [[ ! -d "$REPO/.git" ]]; then
    continue
  fi

  REPO_NAME=$(basename "$REPO")
  REPO_COMMITS=0
  BRANCH_SHAS=()

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

  # Collect SHAs from main branch
  if [[ -n "$MAIN_BRANCH" ]]; then
    MAIN_SHAS=()
    if [[ ${#AUTHOR_EMAILS[@]} -gt 0 ]]; then
      for email in "${AUTHOR_EMAILS[@]}"; do
        EMAIL_SHAS=(${(@f)$(git -C "$REPO" log --since="$TODAY 00:00:00" --until="$TODAY 23:59:59" --author="$email" --format="%H" $MAIN_BRANCH 2>/dev/null)})
        MAIN_SHAS+=("${EMAIL_SHAS[@]}")
      done
    else
      MAIN_SHAS=(${(@f)$(collect_commit_shas_in_branch "$REPO" "$MAIN_BRANCH")})
    fi
    BRANCH_SHAS+=("${MAIN_SHAS[@]}")
  fi

  # Collect SHAs from other branches
  for BRANCH in "${BRANCHES[@]}"; do
    # Skip if it's the main branch we already counted
    if [[ "$BRANCH" == "$MAIN_BRANCH" ]]; then
      continue
    fi
    BRANCH_ONLY_SHAS=(${(@f)$(collect_commit_shas_in_branch "$REPO" "$BRANCH")})
    BRANCH_SHAS+=("${BRANCH_ONLY_SHAS[@]}")
  done

  # Deduplicate SHAs and count unique
  if [[ ${#BRANCH_SHAS[@]} -gt 0 ]]; then
    UNIQUE_SHAS=$(printf "%s\n" "${BRANCH_SHAS[@]}" | sort | uniq)
    REPO_COMMITS=$(printf "%s\n" "$UNIQUE_SHAS" | grep -c ".")
    if [[ $REPO_COMMITS -gt 0 ]]; then
      ACTIVE_REPOS+=("$REPO_NAME")
      TOTAL_COMMITS=$((TOTAL_COMMITS + REPO_COMMITS))
    fi
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
if [[ $TOTAL_COMMITS -eq 0 ]]; then
  echo "No commits made today."
else
  echo "$TOTAL_COMMITS commits today in: $REPOS_LIST"
fi
