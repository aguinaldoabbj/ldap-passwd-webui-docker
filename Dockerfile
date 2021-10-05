FROM nginx:alpine

RUN apk add openssl ldap-passwd-webui-waitress uwsgi-python uwsgi-logfile

COPY gen-selfsigned.sh /tmp/gen-selfsigned.sh

COPY entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/gen-selfsigned.sh /tmp/entrypoint.sh

COPY uwsgi.ini /etc/uwsgi/uwsgi.ini

COPY default.conf /etc/nginx/conf.d/default.conf

COPY ldap-passwd-webui.ini /etc/ldap-passwd-webui.ini

ENV CONF_FILE=/etc/ldap-passwd-webui.ini

ENTRYPOINT ["/tmp/entrypoint.sh"]

EXPOSE 443/tcp