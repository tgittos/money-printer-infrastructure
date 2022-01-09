FROM hasura/graphql-engine:latest.cli-migrations-v3

RUN echo APT::Install-Recommends "0"; APT::Install-Suggests "0"; >> /etc/apt/apt.conf
RUN apt-get update && apt-get install -y curl

RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash

RUN apt-get purge $(aptitude search '~i!~M!~prequired!~pimportant!~R~prequired!~R~R~prequired!~R~pimportant!~R~R~pimportant!busybox!grub!initramfs-tools' | awk '{print $2}') &&\
    apt-get purge aptitude && \
    apt-get autoremove && \
    apt-get clean
RUN rm -Rf /usr/share/man/??_*
