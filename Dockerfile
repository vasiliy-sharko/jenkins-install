FROM alpine:3.12

RUN apk update && apk add --no-cache fortune

USER 1001

ENTRYPOINT ["fortune"]
