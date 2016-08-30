FROM ubuntu:14.04
MAINTAINER https://github.com/aronahl
WORKDIR /root/
RUN apt-get update && apt-get install --no-install-recommends -fy \
        build-essential \
        wget \
        gettext &&\
    cd /root && \
    wget 'http://www.deater.net/weave/vmwprod/linux_logo/linux_logo-5.11.tar.gz' && \
    tar -xzvf linux_logo*.tar.gz && \
    cd /root/linux_logo-5.11 && \
    ./configure && \
    make && \
    make logos-all && \
    make install && \
    apt-get remove -fy build-essential wget gettext && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /root/linux_l*
ENTRYPOINT ["/usr/local/bin/linux_logo"]
