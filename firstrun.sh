echo "\n\nInstalling Homebrew...\n\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "\n\nInstalling Ansible with Brew...\n\n"
brew install ansible

echo "\n\nNow ready to run `ansible-playbook install-playbook.yml`"
