This repository contains everything that is required to provision and manage [The Changelog](https://2016.changelog.com) infrastructure.

Most of it is Ansible playbooks and roles, but also Dockerfiles, Concourse pipeline configurations and scripts that hold everything together.

When starting out, run `script/setup` first. This will install all required dependencies on OS X. After the initial run, you only need to run `setup` since `$PWD/script` will be added to `$PATH`.

The most important command is `ansible-playbook 2016.yml`. This provisions and keeps all VMs up-to-date.

If you need to figure out a specific process (e.g. backups, creating a new host, credentials etc.) or want to understand **the why**, look in [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1650121). The tracker also serves the role of a [wiki](https://www.pivotaltracker.com/n/projects/1650121/search?q=label%3A%22wiki%22).

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
# or, YubiKey static passwords
# generate SSH key with passhprase
ssh-keygen -t rsa -b 4096
# backup private key & passphrase in Lastpass or iCloud Keychain
```

When choosing an SSH key name, capture the host and date: e.g. `eve_20160716`. Whenever you see the SSH key filename, ask yourself: _has it been more than 6 months since it was created_? If the answer is yes, rotate it.
