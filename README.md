# cloud9-stuff

My Cloud9 stuff...

## Setting up

After initializing an environment:

```
./cloud9-stuff/setup.sh
```

This will:

1. Set up Git username and email. This allows you to run `git commit`.
2. Set up `rsyncd`. This allows you to use the rsync protocol to synchronize files between your local machine and Cloud9 environment. The `rsync` daemon is not publicly exposed; you must access it through SSH.
3. Set up Node.js v10 and Yarn.
4. Set up `c9` CLI utility. This allows you to run `c9 <filename>` to edit the file directly in Cloud9’s editor.
5. Set up `ntfy`. This allows you to send notifications to your phone or Slack from Cloud9.
6. Set up `docker-compose`. This allows you to run `docker-compose up` in projects using docker-compose.
7. Set up `public-ip`. This handy command lets you find out your own public IP easily and quickly.
8. Set up [`.bashrc`](./.bashrc) to add convenient aliases and also load `~/environment/bashrc.local` automatically.

## Available scripts

This will resize your Cloud9 instance to 40 GB.

```
./cloud9-stuff/resize.sh 40
```
