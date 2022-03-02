FROM ubuntu:20.04 AS builder

RUN apt-get update; DEBIAN_FRONTEND=noninteractive apt-get install -o Dpkg::Options::='--force-confold' --force-yes -fuy git python3 build-essential openssl libssl-dev enchant python3-venv python3-pip rustc && pip3 install --upgrade pip; pip3 install setuptools-rust; pip3 install wheel; pip3 install check-wheel-contents;

WORKDIR /output

FROM builder as wheel-builder

COPY ./build.sh .

RUN chmod +x ./build.sh

ENTRYPOINT ["/bin/bash", "-c", "./build.sh"]
