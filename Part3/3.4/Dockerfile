FROM docker:20.10.24

RUN apk add --no-cache bash git

COPY builder.sh /usr/local/bin/builder.sh

RUN chmod +x /usr/local/bin/builder.sh

ENV DOCKER_USER=""
ENV DOCKER_PWD=""

ENTRYPOINT ["builder.sh"]
