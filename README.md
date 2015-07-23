# Paul Bennett-Freeman's dotfiles repo

All configuration is done via Ansible playbooks.

| Playbook | Notes |
| -------- | ----- |
| link-files-playbook.yml | Does the heavy lifting of linking files and setting up directories and permissions. Cross platform. |
| homebrew-playbook.yml | Installs required homebrew recipes. Mac OS X specific. |
| homebrew-playbook.yml --extra-vars "homebrew_state=latest" | As above, but install the latest version of all resources |


