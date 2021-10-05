#!/bin/sh

/tmp/gen-selfsigned.sh

uwsgi /etc/uwsgi/uwsgi.ini &

nginx -g 'daemon off;'