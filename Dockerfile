# syntax=docker/dockerfile:1
# escape=`
FROM golang:1.21-alpine3.18 as build

WORKDIR /src
COPY . .
RUN go build -o wiki ./wiki.go

FROM scratch
COPY --from=build /src/ .
CMD [ "./wiki" ]