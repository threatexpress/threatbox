# Threatbox - Standard Attack Platform

ThreatBox is a standard and controlled Linux based attack platform. I've used a version of this for years. It started as a collection of scripts, lived as a rolling virtual machine, existed as code to build a Linux ISO, and has now been converted to a set of ansible playbooks. Why Ansible? Why not? This seemed to be the next natural evolution to the configuration of standard attack platforms.

This project uses ansible playbooks and roles to perform post deployment configuration on a linux target (Tested on Ubuntu 18.04).

The project is designed to be used as a starter process in creating, managing, and using a standard attack platform for red teaming or penetration testing.

Detail on the concept of a Standard Attack Platform can be found it the book Red Team Development and Operations - A practical guide, written by Joe Vest and James Tubberville.

![ThreatBox](threatbox.png)
------------------------------------
## Features

- Standard tools defined as ansible roles
- Customizations designed to make security testing easier
- Variable list to add or remove git repositories, OS packages, or python modules. (threatbox.yml)
- Version tracking of the deployed instance version and the deploy tool version. This is helpful it meeting compliance rules and can help minimize fear by actively tracking all tools. 
  - Threatbox version created at deployment and displayed in desktop wallpaper
  - Deployed software tracked in ~/Desktop/readme
- SSH port auto-switching. The deployment starts on port 22, but reconfigures the target system to the desired SSH port using the `ansible_port` variable in `threatbox.yml`
- Download and compile several .net toolkits (i.e. SeatBelt.exe from Ghostpack https://github.com/GhostPack/Seatbelt)
- Most python projects installed using pipenv. Use `pipenv shell` in the project directory to access. See https://realpython.com/pipenv-guide/ for pipenv usage guidance
------------------------------------
## Project Files

The following list highlights key components of this project.

File/Directory                      | Description                                       | Usage
------------------------------------|---------------------------------------------------|------
host                                | Ansible hosts file                                | Update with IP addresses of target ansible systems
group_vars/threatbox.yml            | common variables                                  | variable used for the project. update as needed.
threatbox_playbox.yml               | Primary ansible playbook                          | Update as need to add additional roles or features
roles/common                        | Common OS platform configuration                  | Setup common OS settings (i.e set version in background or build)
roles/.                             | other specific roles to configure or deploy tools | add or modify roles in roles/ 

------------------------------------
## Quickstart

1) Copy `hosts.sample` to `hosts`
2) Edit `hosts` with the IP(s) of your target systems
3) Copy `group_vars\threatbox.yml.sample` to `group_vars\threatbox.yml`
4) Edit `group_vars\threatbox.yml` with the updated variables you would like to use
   - Don't forget to update SSH key with a key that has access to the remote target

------------------------------------
## Deploy using Ansible

```
# OSX issue https://github.com/ansible/ansible/issues/32499
if [[ "$(uname)" == "Darwin" ]]
then
    #export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=yes;
fi

# Ansible Logging
rm ./ansible.log
export ANSIBLE_LOG_PATH="ansible.log"

# Ansible Debugging
export ANSIBLE_DEBUG=False

# Execute playbook
ansible-playbook -i hosts threatbox_playbook.yml 
```

------------------------------------
## Remotely Access the system

### Access with SSH

Note: SSH is set to a non default port during setup. This value is set in the `group_vars/threatbox.yml` files

```
threatboxip=10.10.10.10
sshport=52222
ssh -p $sshport -i ~/.ssh/threatbox_id_rsa root@$threatboxip
```

### Access with VNC over SSH

Note: VNC is setup but not allowed over the network. You must use an SSH tunnel to access.

```
threatboxip=10.10.10.10
sshport=52222
ssh -p $sshport -i ~/.ssh/threatbox_id_rsa -L 5901:localhost:5901 root@$threatboxip
```

## Notes on the project

This project uses ansbile roles. These roles may not exactly follow the ansible style. They were designed to be used as part of this project and use a single 'variable' file to control the project. The roles can easily be used in other project with minor tweaks.


