#!/bin/bash
cd /usr/src

echo "downloading"
wget -O $(uname -r).tar.gz https://mirrors.aliyun.com/linux-kernel/v5.x/linux-5.10.76.tar.gz
tar -zxvf $(uname -r).tar.gz -C .
mv linux-5.10.76/ $(uname -r)

echo "creating dir"
mkdir -p /lib/modules/$(uname -r)
cd /lib/modules/$(uname -r)


bash