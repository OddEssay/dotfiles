# Paul Bennett-Freeman's dotfiles repo

All configuration is done via Ansible playbooks.

Initial install of Ansible needs to be done by hand using standard instructions as per the website, you can then run the required playbooks to setup all features required. Playbooks can be run multiple times without risk.

| Playbook | Notes |
| -------- | ----- |
| link-files-playbook.yml | Does the heavy lifting of linking files and setting up directories and permissions. Cross platform. |
| homebrew-playbook.yml | Installs required homebrew recipes. Mac OS X specific. |
| homebrew-playbook.yml --extra-vars "homebrew_state=latest" | As above, but install the latest version of all resources |

# Notes and Documentation
```cheatsheet.md``` contains a list of my common Vim commands and a few related keys such as Tmux interactions for easy reference.
