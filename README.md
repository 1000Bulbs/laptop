# Laptop

[![ci](https://github.com/1000bulbs/laptop/actions/workflows/ci.yml/badge.svg)](https://github.com/1000Bulbs/laptop/actions/workflows/ci.yml)

Laptop is a script to set up a macOS laptop for web development.

It can be run multiple times safely on the same machine. It installs and
upgrades packages based on what is already installed.

## Requirements

- macOS Sequoia (15.x) on Apple Silicon
- macOS Tahoe (26.x) on Apple Silicon

## Install

Download the script:

```sh
curl --remote-name https://raw.githubusercontent.com/1000bulbs/laptop/master/mac
```

Run the script:

```sh
sh mac 2>&1 | tee ~/laptop.log
```

Optionally, review the log:

```sh
less ~/laptop.log
```

## Debugging

Your last laptop run will be saved to `~/laptop.log`. Read through it and see if
you can find the issue. If not, open a [new GitHub
Issue](https://github.com/1000bulbs/laptop/issues/new) and attach the log file
as an attachment.

## Docker Login

1000bulbs repos make extensive use of CLI tools and scripts. Many of these
require access to the Docker Hub and the images we've prepared for development.
To fully setup your personal workstation to work seamlessly with Docker, see
the additional instructions for logging into [Docker](./docs/Docker.md).

## What This Script Sets Up

### macOS tools

- [Homebrew] for managing operating system libraries.

[Homebrew]: http://brew.sh/

Unix tools:

- [Git] for version control
- [OpenSSL] for Transport Layer Security (TLS)
- [The Silver Searcher] for finding things in files
- [Ripgrep] for searching files and directories
- [Tmux] for saving project state and switching between projects
- [Zsh] as your shell
- [Zstd] for fast compression

[Git]: https://git-scm.com/
[OpenSSL]: https://www.openssl.org/
[The Silver Searcher]: https://github.com/ggreer/the_silver_searcher
[Ripgrep]: https://github.com/BurntSushi/ripgrep
[Tmux]: https://tmux.github.io/
[Zsh]: https://www.zsh.org/
[Zstd]: https://facebook.github.io/zstd/

GitHub tools:

- [GitHub CLI] for interacting with the GitHub API

[GitHub CLI]: https://cli.github.com/

Image tools:

- [ImageMagick] for cropping and resizing images

Programming languages, package managers, and configuration:

- [asdf-vm] for managing programming language versions
- [Bundler] for managing Ruby libraries
- [Node.js] and [npm], for running apps and installing JavaScript packages
- [Ruby] stable for writing general-purpose code
- [Yarn] for managing JavaScript packages
- [Rosetta 2] for running tools that are not supported in Apple silicon processors

[Bundler]: https://bundler.io/
[ImageMagick]: https://www.imagemagick.org/
[Node.js]: http://nodejs.org/
[npm]: https://www.npmjs.org/
[asdf-vm]: https://github.com/asdf-vm/asdf
[Ruby]: https://www.ruby-lang.org/en/
[Yarn]: https://yarnpkg.com/en/
[Rosetta 2]: https://developer.apple.com/documentation/apple-silicon/about-the-rosetta-translation-environment

Databases:

- [Postgres] for postgres libraries
- [MySQL] for mysql libraries

[Postgres]: https://www.postgresql.org/
[MySQL]: https://www.mysql.com

### macOS apps

- [1Password] for managing passwords and sensitive information
- [Docker] for containerization
- [Loom] for screen recording and sharing
- [Microsoft Teams] for office communication
- [Slack] for team communication
- [Zoom] for video conferencing

[1Password]: https://1password.com/
[Docker]: https://www.docker.com/
[Loom]: https://www.loom.com/
[Microsoft Teams]: https://www.microsoft.com/en-us/microsoft-teams/
[Slack]: https://slack.com/
[Zoom]: https://zoom.us/

## Customizations

You can add your own customizations by adding them to your `~/.laptop.local`
file, which is run at the end of the laptop script.

Put your customizations there.
For example:

```sh
#!/bin/sh

brew bundle --file=- <<EOF
brew "go"
EOF

fancy_echo "Cleaning up old Homebrew packages ..."
brew cleanup
```

Make sure your customizations can be run safely more than once.
See the `mac` script for examples.

## Testing

Follow shell style guidelines by using [ShellCheck].

```sh
brew install shellcheck
```

[ShellCheck]: https://www.shellcheck.net/about.html

Test laptop script

```sh
shellcheck mac
```

Test customizations script

```sh
shellcheck ~/.laptop.local
```

## Git Hooks

This project includes [pre-commit](https://pre-commit.com/) integration via Git
hooks to automatically run formatting and linting checks **before each commit**.

These hooks help catch errors early and keep the codebase consistent across
contributors.

### Install Git Hooks

```bash
make install-hooks
```

This will:

- Install pre-commit (if not already installed)
- Register a Git hook in .git/hooks/pre-commit
- Automatically run checks like:
- Linting with shellcheck and yamllint

### Remove Git Hooks

```bash
make uninstall-hooks
```

This removes the Git pre-commit hook and disables automatic checks.

💡 Even with hooks uninstalled, you can still run the same checks manually with
`make test`.

Why Use Git Hooks?

- Ensures consistency across contributors
- Catches syntax and style issues before they hit CI
- Prevents accidental commits of broken or misformatted files
- Integrates seamlessly with your local workflow
