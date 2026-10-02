FROM alpine:latest
RUN apk add --no-cache curl bash
RUN bash -c "$(curl -fsSL https://githubusercontent.com)"
EXPOSE 54321
CMD ["/usr/local/x-ui/x-ui"]
