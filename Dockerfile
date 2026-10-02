
FROM alpine:3.19

RUN apk add --no-cache tzdata ca-certificates tini bash curl wget && \
    mkdir -p /etc/x-ui /usr/local/x-ui

# Download verified stable 3x-ui compiled binary directly from release mirror
RUN wget -qO /tmp/x-ui.tar.gz https://github.com && \
    tar -zxf /tmp/x-ui.tar.gz -C /usr/local/ && \
    rm -f /tmp/x-ui.tar.gz

WORKDIR /usr/local/x-ui

EXPOSE 54321

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["./x-ui"]


