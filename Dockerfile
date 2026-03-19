# Build the Hugo site
FROM alpine:3.20.1 AS builder
RUN apk update && apk add hugo
WORKDIR /src
COPY . /src
RUN hugo -v --source=/src --destination=/src/public

# Serve with Nginx
FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

