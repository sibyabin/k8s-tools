# installers

## [kubectl-installer.sh]([kubectl-installer.sh)

This script can be used to install kubectl for ARM and X64

```
git clone https://github.com/sibyabin/k8s-tools.git
cd k8s-tools/01-installers
sh kubectl-installer.sh
```
This will produce an output like below. You will see the successful installation message and the CLI version printed in the logs.
```
$ sh kubectl-installer.sh
INFO:Processor type=aarch64
INFO:Going to use the command 'curl -LO 'https://dl.k8s.io/release/v1.27.4/bin/linux/arm64/kubectl''
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   138  100   138    0     0    394      0 --:--:-- --:--:-- --:--:--   394
100 44.8M  100 44.8M    0     0   835k      0  0:00:54  0:00:54 --:--:-- 1136k
INFO:Installation successful
clientVersion:
  buildDate: "2023-07-19T12:20:54Z"
  compiler: gc
  gitCommit: fa3d7990104d7c1f16943a67f11b154b71f6a132
  gitTreeState: clean
  gitVersion: v1.27.4
  goVersion: go1.20.6
  major: "1"
  minor: "27"
  platform: linux/arm64
kustomizeVersion: v5.0.1

```


## [minikube-installer.sh](minikube-installer.sh)

This script can be used to install minicube which will help setup local k8 clusters

##### Pre-requisite:
 - Working Docker setup. Please refer https://minikube.sigs.k8s.io/docs/start/ for more details.

```
git clone https://github.com/sibyabin/k8s-tools.git
cd k8s-tools/01-installers
sh minikube-installer.sh
```
This will produce an output like below. You will see the successful installation message and the CLI version printed in the logs.

```
$ sh minikube-installer.sh
INFO:Processor type=aarch64
INFO:Docker will be used as the default minikube driver.
INFO:Searching for a working DOCKER setup in the system.
INFO:Found a working docker setup
INFO:Going to use the command 'curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 79.0M  100 79.0M    0     0  2232k      0  0:00:36  0:00:36 --:--:-- 2341k
INFO:Minikube installation is successful
INFO:Version = minikube version: v1.31.1
commit: fd3f3801765d093a485d255043149f92ec0a695f

```