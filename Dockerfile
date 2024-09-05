FROM golang:1.20.5-alpine AS builder

WORKDIR /app

ENV CGO_BUILD=0

COPY . .

RUN go build main.go

FROM alpine

COPY --from=builder /app /app

CMD ["/app/main"]