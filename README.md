## OS X development setup

Run `script/setup` script for the initial setup. After the initial run, you only need to run `setup` since direnv will prepend `$PWD/script` to `$PATH`.

## New host - first time configuration

1. Add host details to **~/.ssh/config**
```cfg
# Prevent SSH connections timing out (poll the server every 60")
ServerAliveInterval 60
ServerAliveCountMax 3
# Forward local keys remotely
ForwardAgent yes

Host *
  User root

Host app
  Hostname 198.74.61.95
Host ci
  Hostname 45.56.99.251
```
1. SSH for the first time so that the host will be added to the **~/.ssh/known_hosts** file
1. Add SSH public key to **/root/.ssh/authorized_keys**
```sh
mkdir ~/.ssh
chmod 700 !$
cat > ~/.ssh/authorized_keys
# YOUR PUBLIC KEY(S)
^C
chmod 600 !$
```
1. Add host alias and IP to **hosts**
```
app ansible_ssh_host=198.74.61.95
```
1. `ansible-playbook 2016.yml -l [HOST-ALIAS]`

## Links

[2016 Changelog](https://2016.changelog.com)

[Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1650121)

[CI](https://ci.changelog.com)

[Github](https://github.com/thechangelog/infrastructure)
