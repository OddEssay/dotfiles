# Paul Bennett-Freeman's dotfiles repo

## On a new machine:

Run `firstrun.sh` from the terminal to get the basics installed, after that everything is handled by Ansible.

| Playbook | Notes |
| -------- | ----- |
| link-files-playbook.yml | Does the heavy lifting of linking files and setting up directories and permissions. Cross platform. |
| install-playbook.yml | Installs required software. Mac OS X specific. |
| install-playbook.yml --extra-vars "install_state=latest" | As above, but install the latest version of all resources |

# Notes and Documentation
```cheatsheet.md``` contains a list of my common Vim commands and a few related keys such as Tmux interactions for easy reference.
