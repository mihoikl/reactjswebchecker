FROM alpine:3.15 AS downloader
ARG TEMPLATE_REPO=""
RUN apk add git \
    && git clone ${TEMPLATE_REPO} /tmp

FROM node:14 AS react_builder
WORKDIR /app
COPY --from=downloader /tmp /app
RUN npm install
RUN npm run build 

FROM nginx:latest
COPY --from=react_builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf 
EXPOSE 80
