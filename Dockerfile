FROM ubuntu:18.04 as builder

RUN apt-get update && apt-get install -y wget unzip

RUN cd /root \
    && wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip \
    && unzip protoc-3.6.1-linux-x86_64.zip

FROM ubuntu:18.04

COPY --from=builder /root/bin/protoc /usr/local/bin
RUN chmod +x /usr/local/bin/protoc