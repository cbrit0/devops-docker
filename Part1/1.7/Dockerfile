FROM ubuntu:22.04

RUN apt update && apt install -y curl

WORKDIR /usr/src/app

COPY script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["./script.sh"]