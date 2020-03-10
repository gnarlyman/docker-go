FROM golang

# must have source.list created to build (not in repo)
ADD sources.list /etc/apt/sources.list.d/cs-sources.list
RUN apt-get update || true
RUN apt-get install -y --force-yes libzmq5-dev libzookeeper-mt-dev librdkafka1 librdkafka-dev

RUN mkdir /build
ENV GOPATH="/go"
ENV ARCHFLAGS="-arch x86_64"
