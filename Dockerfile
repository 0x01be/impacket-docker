FROM alpine as build

RUN apk add --no-cache --virtual impacket-build-dependencies \
    git \
    build-base \
    python3-dev \
    py3-pip \
    libffi-dev \
    openssl-dev

ENV IMPACKET_REVISION master
RUN git clone --depth 1 --branch ${IMPACKET_REVISION} https://github.com/SecureAuthCorp/impacket.git /impacket

WORKDIR /impacket

RUN pip3 install . --prefix=/opt/impacket

