FROM 0x01be/impacket:build as build

FROM alpine

COPY --from=build /opt/impacket/ /opt/impacket/

RUN apk add --no-cache --virtual impacket-runtime-dependencies \
    python3 \
    libffi \
    openssl

RUN adduser -D -u 1000 impacket
RUN mkdir /workspace
RUN chown impacket:impacket /workspace

USER impacket

ENV PATH ${PATH}:/opt/xsser/bin/
ENV PYTHONPATH /usr/lib/python3.8/site-packages/:/opt/impacket/lib/python3.8/site-packages/

WORKDIR /workspace

