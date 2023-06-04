FROM golang:1.20-alpine as builder-go
WORKDIR /app
COPY *.go /app
RUN go build -ldflags "-s -w"  fullcycle-rocks.go

FROM scratch
WORKDIR /app
COPY --from=builder-go /app/fullcycle-rocks /app/fullcycle-rocks
CMD [ "/app/fullcycle-rocks" ]