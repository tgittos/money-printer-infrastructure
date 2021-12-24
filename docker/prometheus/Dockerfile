FROM alpine:3.14

RUN apk update
RUN apk add --no-cache tar wget

COPY --from=golang:1.13-alpine /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

WORKDIR /app

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.32.1/prometheus-2.32.1.linux-amd64.tar.gz
RUN tar -xvzf prometheus-2.32.1.linux-amd64.tar.gz

EXPOSE 9090

WORKDIR /app/prometheus-2.32.1.linux-amd64

RUN chmod +x prometheus

COPY configuration.yml configuration.yml
COPY prometheus.sh prometheus.sh