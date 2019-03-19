#!/bin/bash -e

echo
echo '# Setup Git...'
if [ -z "$(git config --global user.name)" ]
then
  echo -n '  * GitHub username: '
  read USERNAME
  git config --global user.name "$USERNAME on Cloud9"
  echo -n '  * GitHub email: '
  read EMAIL
  git config --global user.email "$EMAIL"
  echo "  * Git is set up."
else
  echo "  * Already done. Hi, $(git config --global user.name)!"
fi

echo
echo '# Setup rsyncd...'
if [ ! -e "/etc/rsyncd.conf" ]
then
  sudo ln -s "$HOME/environment/cloud9-stuff/rsyncd.conf" "/etc/rsyncd.conf"
  echo "  * Linked rsyncd configuration to /etc/rsyncd.conf."
  sudo yum install -y xinetd
  sudo chkconfig rsync on
  sudo service xinetd start
  rsync -rdt rsync://localhost
else
  echo "  * Already done. /etc/rsyncd.conf already exists."
fi

echo
echo '# Setup Node.js'
if ! [ -x "$(command -v npx)" ]
then
  nvm install 10
  nvm alias default 10
  echo "  * Node.js is set up."
else
  echo "  * Already done. Using Node.js $(node --version)"
fi

echo
echo '# Setup Yarn'
if ! [ -x "$(command -v yarn)" ]
then
  npm i -g yarn
  echo "  * Yarn is set up."
else
  echo "  * Already done."
fi

echo
echo '# Setup c9'
if ! [ -x "$(command -v c9)" ]
then
  npm i -g c9
  echo "  * c9 is set up."
else
  echo "  * Already done."
fi

echo
echo '# Setup ntfy'
if ! [ -x "$(command -v ntfy)" ]
then
  sudo pip install ntfy
  echo "  * ntfy is set up."
else
  echo "  * Already done."
fi