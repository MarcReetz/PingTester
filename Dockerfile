# syntax=docker/dockerfile:1

FROM golang:1.19

WORKDIR /dockerApp

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o /docker-gs-ping

ENV PATH="./.env"

CMD [ "/docker-gs-ping" ]