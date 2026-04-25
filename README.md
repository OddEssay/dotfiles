# Paul Bennett-Freeman's dotfiles repo

## On a new machine:

Run `firstrun.sh` from the terminal to get the basics installed (Homebrew + Ansible), then use `install.sh` for subsequent runs.

| Command | Notes |
| ------- | ----- |
| ./install.sh | Runs `brew bundle` then the Ansible install playbook. Use this for day-to-day installs/updates. |
| ansible-playbook link-files-playbook.yml | Does the heavy lifting of linking files and setting up directories and permissions. Cross platform. |
| ansible-playbook install-playbook.yml | Installs required software (excluding brew packages). Mac OS X specific. |
| ansible-playbook install-playbook.yml --extra-vars "install_state=latest" | As above, but install the latest version of all resources |

> `brew bundle` is run outside the playbook so that upgrading `ansible` itself doesn't disrupt the running playbook.

# Notes and Documentation
```cheatsheet.md``` contains a list of my common Vim commands and a few related keys such as Tmux interactions for easy reference.
