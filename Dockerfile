FROM golang:1.18-alpine
WORKDIR /usr/src/app
COPY . .
RUN go mod download
COPY ./ ./src
RUN go build -o . .
EXPOSE 8080
CMD ["/usr/src/app/ConsocioAccion"]