#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

echo "==> Running brew bundle..."
brew bundle

echo "==> Running ansible-playbook install-playbook.yml..."
ansible-playbook install-playbook.yml "$@"
