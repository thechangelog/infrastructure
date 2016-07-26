## OS X development setup

Run `script/setup` script for the initial setup. After the initial run, you only need to run `setup` since direnv will prepend `$PWD/script` to `$PATH`.

## New host - first time configuration

1) Add host details to **~/.ssh/config**

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

2) `ssh-copy-id -f [YOUR PUBLIC KEY] ci`

3) Add host alias and IP to **hosts**

```
app ansible_ssh_host=198.74.61.95
```

4) `ansible-playbook 2016.yml -l [HOST-ALIAS]`

## Helps

### How do I access secret keys & credentials?

Sign up for a lastpass.com account, then ask either Jerod, Adam or Gerhard to add you to the Changelog Lastpass share.

### How do I get SSH access to hosts running changelog.com?

Ensure you have a secure SSH key, add the `.pub` key to Lastpass **Shared-changelog/authorized_keys** item and ask either Jerod, Adam or Gerhard to run the hosts provisioning.

### How do I create a secure SSH key?

Ensure you have an RSA key, use a passphrase, and 2048 bits minimum (preferably 4096):

```sh
# pick a secure passphrase
pwgen -s 64
# generate SSH key with passhprase
ssh-keygen -t rsa -b 4096
# backup private key & passphrase in Lastpass or iCloud Keychain
```

When choosing an SSH key name, I prefer **HOSTNAME_YYYYMMDD**, e.g. `eve_20160716`. The date part will capture when the key was generated and will serve as a reminder for when the time comes to rotate it (preferably every 6 months).

## Links

[2016 Changelog](https://2016.changelog.com)

[Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1650121)

[CI](https://ci.changelog.com)

[Github](https://github.com/thechangelog/infrastructure)
