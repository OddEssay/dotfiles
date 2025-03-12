env-ngrok() {
  echo "🦔 Switching to ngrok environment..."
  
  # Check if .env.ngrok exists
  if [ ! -f .env.ngrok ]; then
    echo "❌ Error: .env.ngrok file not found in current directory!"
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
  ln -s .env.ngrok .env
  
  # Source the environment variables
  if [ -f .env.ngrok ]; then
    echo "🌐 Loading ngrok environment variables..."
    set -a # automatically export all variables
    source .env.ngrok
    set +a
    echo "✅ Environment switched to ngrok successfully!"
  else
    echo "❌ Failed to source environment variables!"
    return 1
  fi
}
