FROM alpine:3.23.3@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
  RUN  apk upgrade --update --no-cache \
    && apk add --update --no-cache lighttpd \
    && rm -rf /var/cache/apk/* \
    && chown lighttpd:lighttpd /var/www/localhost/htdocs

  COPY ./lighttpd.conf /etc/lighttpd/lighttpd.conf

  USER lighttpd
  EXPOSE 5000

  CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
