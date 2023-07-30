#!/bin/bash

# Title: minikube-installer
# Description: minikube cli installation script
# Author: Siby Abin Thomas
# Date: 2023-07-22

set -e

error_exit() {
    echo "ERROR:Error while installing minikube. Please refer https://minikube.sigs.k8s.io/docs/start/"
    exit 1
}

check_prerequisites() {
    echo "INFO:Docker will be used as the default minikube driver."
    echo "INFO:Searching for a working DOCKER setup in the system."
    flag=$(docker ps | grep COMMAND | wc -l)
    if [ $flag -eq 1 ]
    then
        echo "INFO:Found a working docker setup"
    else
        error_exit
    fi
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

# Check docker is setup properly (the user should be able to run without root permissions)
check_prerequisites

command="curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-${key}"
echo "INFO:Going to use the command '${command}'"
eval ${command}
eval "sudo install minikube-linux-${key} /usr/local/bin/minikube"
if [ $? -eq 0 ]
then
   echo "INFO:Minikue installation is successful"
   echo "INFO:Version = $(minikube version)"
else
   error_exit
fi

exit 0