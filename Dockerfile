FROM alpine:3.11.5

RUN pkgs="certbot nginx ca-certificates pcre apr-util libjpeg-turbo icu icu-libs python3 libressl-dev" && \
    apk add --update --no-cache ${pkgs} && \
    echo -e "#!/usr/bin/env sh\n\nif [ -f "/usr/bin/certbot" ]; then\n  /usr/bin/certbot renew\nfi\n" > /etc/periodic/daily/certrenew && \
    chmod 755 /etc/periodic/daily/certrenew

EXPOSE 80 443

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
