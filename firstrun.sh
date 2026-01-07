echo "\n\nInstalling Homebrew...\n\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "\n\nInstalling Ansible with Brew...\n\n"
brew install ansible

echo "\n\nNow ready to run `ansible-playbook install-playbook.yml`"
