echo "\n\nInstalling pip...\n\n"
sudo easy_install pip
echo "\n\nInstalling Ansible...\n\n"
sudo pip install ansible
echo "\n\nInstalling Homebrew...\n\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "\n\nNow ready to run `ansible-playbook install-playbook.yml`"
