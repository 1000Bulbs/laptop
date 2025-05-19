# Docker

## Login

Docker provides a number of ways to login:

* Using Docker username / password
* Using Docker username / Personal Access Token (PAT)
* Using Github username / password
* Using Github username / Personal Access Token (PAT)

1000bulbs prefers that all developers use a Personal Access Token (PAT) when logging into remote systems used by 1000bulbs.

Personal Access Tokens (PATs) provide several advantages over using a regular password:

* Passwords no longer need be exchanged, reducing the threat surface to them
* Users are allowed multiple PATs, further reducing the threat surface
* PATs are easy to revoke and replace, saving valuable time in not changing a password

## CLI Login

```bash
# login using your Docker username / password
$ docker login -u <username>
Password: <type or paste password here>
```

```bash
# login using your Docker username and password
$ docker login -u <username> -p <password>
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
```

## Docker Create Access Token

* [Sign into Docker](./Docker%20home%20page.png)
* [Select Account Settings](./Docker%20nav%20menu.png)
* [Select Personal Access Tokens](./Docker%20Account%20settings.png)
* [Click Generate New Token](./Docker%20Personal%20access%20tokens.png)
* [Select Read/Write Permissions](./Docker%20Create%20access%20token%20-%20Access%20permissions.png)
* [Click Generate](./Docker%20Create%20access%20token%20-%20Generate.png)
* [Click Copy to copy the token value](./Docker%20Copy%20access%20token.png)

Save your Personal Access Token (PAT) as part of your user profile

```bash
echo <paste-your-token-value-here> > ~/.docker/docker.pat
```

Login using your Personal Access Token (PAT)

```bash
$ docker login -u <username> --password-stdin < ~/.docker/docker.pat
Login Succeeded
```

Docker will reuse your credentials automatically from the keystore on your operating system,
but there are occasions where Docker will be logged out, and you must repeat the login
sequence. To aid in that step consider creating an alias of the above.

```bash
alias docker:auth='docker login -u <username> --password-stdin < ~/.docker/docker.pat'
```
