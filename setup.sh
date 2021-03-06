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
  sudo apt install -y xinetd
  sudo service rsync start
  sudo service xinetd start
  rsync -rdt rsync://localhost
else
  echo "  * Already done. /etc/rsyncd.conf already exists."
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

echo
echo '# Setup docker-compose'
if ! [ -x "$(command -v docker-compose)" ]
then
  sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "  * docker-compose is set up."
else
  echo "  * Already done."
fi

echo
echo '# Setup public-ip'
if ! [ -x "$(command -v public-ip)" ]
then
  npm i -g public-ip-cli
  echo "  * public-ip is set up."
else
  echo "  * Already done."
fi

echo
echo '# Setup ~/environment/my'
if ! [ -e ~/environment/my ]
then
  git clone git@github.com:dtinth/my.git ~/environment/my
  echo "  * ~/environment/my is set up."
else
  echo "  * Already done."
fi

echo
echo '# Setup ~/my'
if ! [ -e ~/my ]
then
  ln -s ~/environment/my ~/my
  echo "  * ~/my is set up."
else
  echo "  * Already done."
fi

echo
echo '# Setup fish'
if ! [ -x "$(command -v fish)" ]
then
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt-get update
  sudo apt-get install -y fish
  sudo chsh -s /usr/bin/fish ubuntu
  echo "  * fish is set up."
else
  echo "  * Already done."
fi

echo
echo '# Setup oh-my-fish'
if [ -x "$(command -v fish)" ]
then
  if ! [ -e ~/.local/share/omf ]
  then
    curl -L https://get.oh-my.fish > /tmp/omf-installer
    fish /tmp/omf-installer --path=~/.local/share/omf --config=~/my/omf
  else
    echo "  * Already done."
  fi
else
  echo "  * fish is not available."
fi

echo
echo '# Setup bashrc'
if ! grep -q 'cloud9-stuff/\.bashrc' ~/.bashrc
then
  cat >>~/.bashrc <<EOF

source ~/environment/cloud9-stuff/.bashrc

EOF
  echo "  * .bashrc is set up."
else
  echo "  * Already done."
fi

echo
echo '# Setup fzf'
if ! [ -e ~/.fzf ]
then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  echo "  * Already have fzf"
fi

echo
echo '# Setup neovim'
if ! [ -x "$(command -v nvim)" ]
then
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get update
  sudo apt-get install -y neovim
  echo "  * neovim is set up."
else
  echo "  * Already done."
fi