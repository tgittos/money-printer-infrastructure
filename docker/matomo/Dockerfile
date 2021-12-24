FROM alpine:3.14

ENV MYSQL_ROOT_PASSWORD=matomo!QAZxsw2

RUN apk update
RUN apk add --no-cache openrc unzip curl nginx php7 php7-fpm php7-curl php7-gd php7-cli mysql php7-mysqli php7-xml php7-mbstring mysql-client

RUN rc-update add nginx
RUN rc-update add mariadb

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

COPY init-matomo.sh init-matomo.sh

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /www

RUN curl -O https://builds.matomo.org/matomo.zip
RUN unzip matomo.zip

WORKDIR /www/matomo

ENTRYPOINT [ "/bin/bash /init-matomo.sh" ]