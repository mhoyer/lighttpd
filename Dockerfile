FROM alpine:3.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11
  RUN  apk upgrade --update --no-cache \
    && apk add --update --no-cache lighttpd \
    && rm -rf /var/cache/apk/* \
    && chown lighttpd:lighttpd /var/www/localhost/htdocs

  COPY ./lighttpd.conf /etc/lighttpd/lighttpd.conf

  USER lighttpd
  EXPOSE 5000

  CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
