FROM alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf
  RUN  apk upgrade --update --no-cache \
    && apk add --update --no-cache lighttpd \
    && rm -rf /var/cache/apk/* \
    && chown lighttpd:lighttpd /var/www/localhost/htdocs

  COPY ./lighttpd.conf /etc/lighttpd/lighttpd.conf

  USER lighttpd
  EXPOSE 5000

  CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
