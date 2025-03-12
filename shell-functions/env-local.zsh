env-local() {
  echo "🦔 Switching to local environment..."
  
  # Check if .env.local exists
  if [ ! -f .env.local ]; then
    echo "❌ Error: .env.local file not found in current directory!"
    return 1
  fi
  
  # Remove existing .env link if it exists
  if [ -L .env ]; then
    rm .env
  elif [ -f .env ]; then
    echo "⚠️ Warning: .env is a regular file, not a symlink. Backing up to .env.backup"
    mv .env .env.backup
  fi
  
  # Create symbolic link
  ln -s .env.local .env
  
  # Source the environment variables
  if [ -f .env.local ]; then
    echo "🏠 Loading local environment variables..."
    set -a # automatically export all variables
    source .env.local
    set +a
    echo "✅ Environment switched to local successfully!"
  else
    echo "❌ Failed to source environment variables!"
    return 1
  fi
}