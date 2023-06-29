FROM golang:1.21rc2-alpine3.18 AS builder

WORKDIR /go/src

RUN go mod init fullcycle

COPY fullcycle.go .

RUN go build -o fullcycle .

FROM alpine:latest

COPY --from=builder /go/src /bin
CMD [ "fullcycle" ]
