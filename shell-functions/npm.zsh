npm() {
  if [ -e yarn.lock ]; then
    echo ""
    echo "🤬 You forgot to use Yarn  🤬"
    echo ""
  else
    command npm $@
  fi
}