FROM golang:1.16

WORKDIR /usr/src/app

COPY . .

EXPOSE 8080

ENV PORT=8080
ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

USER appuser

CMD [ "./server" ]