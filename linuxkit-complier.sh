#!/bin/bash
cd /lib/modules/$(uname -r)


echo "coping file to source/"
mkdir -p /usr/src/$(uname -r)/
cp -r /usr/src/$(uname -r)/ .
mv $(uname -r) source

echo "coping file to build/"
cp -r /usr/src/$(uname -r)/ .
mv $(uname -r) build

# cp -r /lib/modules/$(uname -r)/source /usr/src/$(uname -r)

echo "creating config file"
cd /usr/src/$(uname -r)
make -r menuconfig   
make -r defconfig
      
echo 'CONFIG_BPF=y' >> .config
echo 'CONFIG_BPF_SYSCALL=y' >> .config
echo 'CONFIG_BPF_JIT=y' >> .config
echo 'CONFIG_HAVE_EBPF_JIT=y' >> .config
echo 'CONFIG_BPF_EVENTS=y' >> .config
echo 'CONFIG_FTRACE_SYSCALLS=y' >> .config
echo 'CONFIG_KALLSYMS_ALL=y' >> .config


echo "preparing"
make -r prepare

bash

