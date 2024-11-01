# Laptop

[![ci](https://github.com/1000bulbs/laptop/actions/workflows/test.yml/badge.svg)](https://github.com/1000Bulbs/laptop/actions/workflows/test.yml)

Laptop is a script to set up a macOS laptop for web development.

It can be run multiple times safely on the same machine. It installs and
upgrades packages based on what is already installed.

## Requirements

- macOS Sonoma (14.x) on Apple Silicon and Intel

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

## MySQL 5.7 Hack

`mysql-client@5.7` is now expired in homebrew, so we will need to install it manually.

Tap homebrew-core

```
brew tap homebrew/core --force
```

Edit the `mysql-client@5.7` formula

```
brew edit mysql-client@5.7
```

Remove the line that begins with

```
disable! date:
```

Edit `openssl@1.1` formmula

`openssl@1.1` is now unsupported, so we need to edit its installation file

```
brew edit openssl@1.1
```

Remove the following line

```
disable! date: "2024-10-24", because: :unsupported
```
 
Install `mysql-client@5.7`

```
HOMEBREW_NO_INSTALL_FROM_API=1 brew install mysql-client@5.7
```

Link mysql binaries

```
brew link --force mysql-client@5.7
```

## Debugging

Your last laptop run will be saved to `~/laptop.log`. Read through it and see if
you can find the issue. If not, open a [new GitHub
Issue](https://github.com/1000bulbs/laptop/issues/new) and attach the log file
as an attachment.

## What This Script Sets Up

macOS tools:

- [Homebrew] for managing operating system libraries.

[Homebrew]: http://brew.sh/

Unix tools:

- [Git] for version control
- [OpenSSL] for Transport Layer Security (TLS)
- [RCM] for managing company and personal dotfiles
- [The Silver Searcher] for finding things in files
- [Tmux] for saving project state and switching between projects
- [Zsh] as your shell

[Git]: https://git-scm.com/
[OpenSSL]: https://www.openssl.org/
[RCM]: https://github.com/thoughtbot/rcm
[The Silver Searcher]: https://github.com/ggreer/the_silver_searcher
[Tmux]: https://tmux.github.io/
[Zsh]: https://www.zsh.org/

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
