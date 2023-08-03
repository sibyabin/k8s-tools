#!/bin/bash

# Title: kubectl-installer
# Description: kubectl cli installation script
# Author: Siby Abin Thomas
# Date: 2023-07-22

set -e

error_exit() {
    echo "ERROR:Error while installing kubectl. Please refer https://kubernetes.io/docs/tasks/tools/ "
    exit 1
}

type=$(uname -m)
echo "INFO:Processor type=${type}"

case "${type}" in
    "aarch64") key='arm64'
               ;;
    "x86_64") key='amd64'
              ;;
    *) error_exit
       ;;
esac

command="curl -LO 'https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${key}/kubectl'"
echo "INFO:Going to use the command '${command}'"
eval ${command}
$(chmod +x kubectl) && $(mkdir -p ~/.local/bin) && $(mv ./kubectl ~/.local/bin/kubectl)
if [ $? -eq 0 ]
then
   echo "INFO:Installation successful"
   echo "$(kubectl version --client --output=yaml)"
else
   error_exit
fi

exit 0
