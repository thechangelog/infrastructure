[![ci.changelog.com](https://ci.changelog.com/api/v1/teams/main/pipelines/changelog.com/jobs/configure/badge)](https://ci.changelog.com/teams/main/pipelines/changelog.com/jobs/configure)

This repository contains everything that is required to provision and manage **The Changelog** infrastructure.

Most of it is Ansible playbooks and roles, but also Dockerfiles,
Concourse pipeline configurations and scripts that hold everything together.

When starting out, run `script/setup` first.
This will install all required dependencies on OS X.
After the initial run, you only need to run `setup` since `$PWD/script` will be added to `$PATH`.

The most important command is `ansible-playbook default.yml`.
This provisions and keeps all servers up-to-date.

The second most important command is `ansible-playbook dotcom.yml`.
This deploys changelog.com.

There is also a command to deploy Concourse (`ansible-playbook concourse.yml`),
and a separate command that will setup changelog.com locally for dev work (`ansible-playbook development.yml`).

Lastly, there are a set of helpful scripts in the `script` directory which should be self-explanatory.

If you need to figure out a specific process (e.g. backups, creating a new host, credentials etc.) or want to understand **the why**,
look in [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1650121).
The tracker doubles up as a [wiki](https://www.pivotaltracker.com/n/projects/1650121/search?q=label%3A%22wiki%22).

### Is it just me, or is it hard to get started with this?

We are talking about this on the Changelog Ping, [help us decide how we continue investing our time](https://github.com/thechangelog/ping/issues/830).

If you want to understand the big picture, read [The code behind changelog.com infrastructure](https://changelog.com/posts/thechangelog-infrastructure).
