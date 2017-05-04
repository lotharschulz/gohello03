#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

if [ "$EUID" -ne 0 ]; then
    echo "This script uses functionality which requires root privileges"
    exit 1
fi

if [ ! -f gohello03-0.0.1-linux-amd64.aci ]; then
  # Start the build with an empty ACI
  $HOME/bin/acbuild --debug begin
  $HOME/bin/acbuild --debug set-name lotharschulz.info/gohello03
  $HOME/bin/acbuild --debug copy gohello03 gohello03
  $HOME/bin/acbuild --debug set-exec gohello03
  $HOME/bin/acbuild --debug port add www tcp 1234
  $HOME/bin/acbuild --debug label add version 0.0.1
  $HOME/bin/acbuild --debug label add arch amd64
  $HOME/bin/acbuild --debug label add os linux
  $HOME/bin/acbuild --debug annotation add authors "Lothar Schulz <mail@lothar-schulz.info>"
  $HOME/bin/acbuild --debug write gohello03-0.0.1-linux-amd64.aci
  $HOME/bin/acbuild end
else
  echo "file gohello03-0.0.1-linux-amd64.aci already exists"
  dialog --yesno "Delete file gohello03-0.0.1-linux-amd64.aci?" 0 0
  # 0=yes; 1=no
  answer=$?
  if [ $answer = 0 ]
  then
     rm -f gohello03-0.0.1-linux-amd64.aci
  fi
fi
