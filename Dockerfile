FROM alpine:3.19

  RUN  apk upgrade --update --no-cache \
    && apk add --update --no-cache lighttpd \
    && rm -rf /var/cache/apk/* \
    && chown lighttpd:lighttpd /var/www/localhost/htdocs

  USER lighttpd
  EXPOSE 5000

  CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
