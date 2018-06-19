FROM golang:1.10.2 as builder

WORKDIR /go/src/github.com/lotharschulz/gohello03/

RUN go get -d -v [TBD]
COPY hello.go	.

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o gohello03 .

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /go/src/github.com/lotharschulz/gohello03/gohello03    .

CMD ["./gohello03"]
