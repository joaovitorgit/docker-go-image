FROM golang:1.17-alpine AS build

WORKDIR /usr/src/app
COPY . .

RUN go build -o main .

FROM scratch

WORKDIR /app

COPY --from=build /usr/src/app/main .

CMD [ "./main" ]