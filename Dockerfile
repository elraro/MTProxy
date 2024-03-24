FROM ubuntu:jammy

RUN set -eux \
    && apt update \
    && apt install -y git curl build-essential libssl-dev zlib1g-dev

RUN git clone https://github.com/elraro/MTProxy \
    && cd MTProxy \
    && make

#RUN set -eux & \
#     apt-get update & \
#     apt-get install -y --no-install-recommends curl ca-certificates & \
#     rm -rf /var/lib/apt/lists/* ;
