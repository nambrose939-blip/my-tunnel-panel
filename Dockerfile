FROM alpine:3.19

RUN apk add --no-cache tzdata ca-certificates tini bash curl && \
    mkdir -p /etc/x-ui /usr/local/x-ui

# Download the pre-compiled, non-interactive Xray web panel architecture
RUN curl -sSLo /tmp/x-ui-linux-amd64.tar.gz https://github.com && \
    tar -zxf /tmp/x-ui-linux-amd64.tar.gz -C /usr/local/ && \
    rm -f /tmp/x-ui-linux-amd64.tar.gz

WORKDIR /usr/local/x-ui

# Expose Render's default web service communication port
EXPOSE 54321

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["./x-ui"]

