FROM golang:1.11.13-alpine3.9 as builder

COPY . /app
WORKDIR /app
RUN go build -o main .

FROM scratch
COPY --from=builder /app /app 
CMD [ "/app/main" ] 