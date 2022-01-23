FROM docker/for-desktop-kernel:5.10.76-505289bcc85427a04d8d797e06cbca92eee291f4 AS ksrc

LABEL maintainer="zeonll@outlook.com"

FROM ubuntu:21.04

WORKDIR /
COPY --from=ksrc /kernel-dev.tar /
RUN tar xf kernel-dev.tar && rm kernel-dev.tar

RUN apt-get update
RUN apt install -y kmod python3-bpfcc wget
RUN apt install -y make gcc flex bison libelf-dev bc 
RUN apt install -y libssl-dev vim


COPY hello_world.py /root
COPY linuxkit-start.sh /root

CMD cd /root/ && sh ./linuxkit-start.sh && mount -t debugfs debugfs /sys/kernel/debug && /bin/bash
