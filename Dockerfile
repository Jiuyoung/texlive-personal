FROM ubuntu:22.10

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    # ConTeXt cache can be created on runtime and does not need to
    # increase image size
    TEXLIVE_INSTALL_NO_CONTEXT_CACHE=1 \
    # As we will not install regular documentation why would we want to
    # install perl docs…
    NOPERLDOC=1

# RUN sed -i 's/ports.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# 直接安装
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends texlive-full \
    make git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/
