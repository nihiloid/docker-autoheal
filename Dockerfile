# aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 630189501741.dkr.ecr.ap-southeast-2.amazonaws.com
# docker buildx build --platform linux/amd64,linux/arm64 -t 630189501741.dkr.ecr.ap-southeast-2.amazonaws.com/autoheal-multi:latest . --push --load

FROM alpine

RUN apk add --no-cache curl jq

COPY docker-entrypoint /
ENTRYPOINT ["/docker-entrypoint"]

HEALTHCHECK --interval=71s CMD /docker-entrypoint healthcheck

CMD ["autoheal"]
