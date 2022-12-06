FROM nginx:stable

MAINTAINER "zgao264@gmail.com"

WORKDIR /etc/nginx/

RUN echo zsxq:"$(openssl passwd zsxq)" >./htpasswd.txt

COPY ./nginx.template ./nginx.template

EXPOSE 80/tcp

CMD /bin/bash -c "envsubst < /etc/nginx/nginx.template > /etc/nginx/nginx.conf && \
exec /usr/sbin/nginx -g 'daemon off;'"
