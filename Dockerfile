FROM golang

# must have source.list created to build (not in repo)
ADD sources.list /etc/apt/sources.list.d/cs-sources.list
RUN apt-get update || true
RUN apt-get install -y --force-yes libzmq5-dev libzookeeper-mt-dev librdkafka1

ADD go.sh /scripts/
ADD lib/* /scripts/lib/

# Just for demo and having something here if the user doesn't pass it in
ADD app.go /app/app.go
WORKDIR /app

RUN mkdir /build
ENV GOPATH="/go"
ENV ARCHFLAGS="-arch x86_64"

# ENTRYPOINT ["sh", "/scripts/go.sh"]
