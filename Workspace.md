# Workspace

The 1000bulbs development team has recommended that all developers use a consistent setup on their local workstations, so that we can continually improve and streamline local development by relying on a known and consistent folder structure.

<pre>
$workspace/ ............... top-level folder for 1000bulbs (e.g. developer name of choice)
 \_ 1kb/ .................. PHP application stack
 \_ aws-iac/ .............. AWS Terraform assets
 \_ fedex/ ................ FedEx API integration
 \_ laptop/ ............... this repo
 \_ qa-automation/ ........ home for our BrowserStack implementations
 \_ strangler/ ............ Ruby on Rails (RoR) application stack
     \_ config/ ........... standard configuration folder for Rails
         \_ master.key .... copy of the $workspace/master.key file
 \_ strangler-ami/ ........ AWS Machine Image for deploying the above
 \_ WyattERP/ ............. implementation of our Wyatt server
 \_ master.key ............ file housing the Master Key we use for both PHP and RoR
</pre>

## `master.key`

This is maintained in 1Password under `strangler master key` and MUST be stored as a file, not a symlink, under the respective `config/` folders of both `1kb` and `strangler` repos for local development.

## Using `@<command>` in place of `./bin/<command>`

Rails projects use the `./bin` directory to house definitions of all the various Rails commands, so they run in the context of the application. An example would be:

```bash
./bin/rake db:migrate
```

instead of the normal version:

```bash
rake db:migrate
```

The `./bin` prefix ensures the command runs with the full environment and Rails context as that of the application. A shortcut for this use of the local `./bin` folder is to instead use:

```bash
@rake db:migrate
```

to enable this on Linux or MacOS you can use the following:

```bash
# anytime the command line starts with a '@' character replace it with the prefix './bin/'
local-rails-cmd() { [[ $BUFFER = @* ]] && BUFFER="./bin/${BUFFER[2,-1]}"; zle .$WIDGET "$@"; }
zle -N accept-line local-rails-cmd
```

by placing this is your `.zshrc` file it will be available everywhere on your machine.

## Multiple Simultaneous Terminal Windows

Install `iTerm2`
```bash
brew install wouterdebie/repo/i2cssh
```

Update `~/.ssh/config` to include server definitions
```bash
# Example: adding the 1st QA Strangler server
Host qa-strangler-01
  HostName <ip-address>
  User deploy
```

```bash
# Example: opening terminals on the 5 QA servers
i2cssh -exec strangler-01 strangler-02 strangler-03 stragnler-04 strangler-05
```

`Command + Shift + i` toggles the ability to type on all terminals
`Command + Shift + Enter` toggles zooming a terminal window

