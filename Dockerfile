FROM alpine:3.24.2@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
  RUN  apk upgrade --update --no-cache \
    && apk add --update --no-cache lighttpd \
    && rm -rf /var/cache/apk/* \
    && chown lighttpd:lighttpd /var/www/localhost/htdocs

  COPY ./lighttpd.conf /etc/lighttpd/lighttpd.conf

  USER lighttpd
  EXPOSE 5000

  CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
