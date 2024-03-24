FROM ubuntu:jammy as builder

RUN set -eux \
    && apt update \
    && apt install -y git curl build-essential libssl-dev zlib1g-dev

RUN git clone https://github.com/elraro/MTProxy \
    && cd MTProxy \
    && make

FROM ubuntu:jammy
RUN mkdir /data
COPY --from=builder MTProxy/objs/bin/mtproto-proxy /usr/local/mtproto-proxy
COPY --from=builder MTProxy/run.sh /run.sh 
RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && rm -rf /var/lib/apt/lists/* ;
CMD ["/run.sh"]
