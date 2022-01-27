## What
A docker of learning eBPF at MacOS/Win.

Ubuntu: 21.04

Kernel: 5.10.76

## Run it!
```
cd ebpf-for-desktop/
docker build -t ebpf:v1 .
sh ./docker-run.sh
```

## How
MacOS/Win is short of some linuxkit/header file, so I built this image based on 
[for-desktop-kernel](https://hub.docker.com/r/docker/for-desktop-kernel) image
and [linux-kernel source code](https://mirrors.aliyun.com/linux-kernel/v5.x/linux-5.10.76.tar.gz).


## FAQ
If could run ebpf programs, try to run `/root/linuxkit-complier.sh` again.
