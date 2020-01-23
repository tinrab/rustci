FROM rust:1.40-alpine3.11 AS build
RUN apk add --no-cache make
WORKDIR /app
COPY . .
RUN make build

FROM alpine:3.11
RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=build /app/target/release/rustci-app /app
ENTRYPOINT [ "./rustci-app" ]
