#!/usr/bin/env sh

if [ -f "/usr/sbin/crond" ]; then
  crond -b -S -l 2
fi

if [ -f "/usr/sbin/nginx" ]; then
  /usr/sbin/nginx -g "daemon off;" "$@"
else
  echo "There is no NGINX application installed"
  "$@"
fi
