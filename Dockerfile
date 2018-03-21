FROM alpine
RUN apk add --no-cache --virtual .build-deps make gcc g++ && \
    apk add --no-cache bash tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    cd /tmp && \
    wget https://ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz && \
    tar xzf lrzsz-0.12.20.tar.gz && \
    cd lrzsz-0.12.20 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf /tmp/* && \
    apk del .build-deps && \
    ln -s /usr/local/bin/lrz /usr/local/bin/rz && \
    ln -s /usr/local/bin/lsz /usr/local/bin/sz
VOLUME /upload
WORKDIR /upload
CMD ["/bin/bash"]