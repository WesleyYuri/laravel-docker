FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

ARG USER=docker
ARG UID=1000
ARG GID=1000

ENV USER=${USER}
ENV UID=${UID}
ENV GID=${GID}

RUN mkdir /home/${USER} && \
    addgroup -S ${GID} && \
    adduser -h /home/${USER} -s /bin/sh -G 1000 -u 1000 -S ${USER} && \
    addgroup ${USER} www-data

RUN chown -R ${UID}:${GID} /var/www/html

USER ${USER}

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require laravel/installer

ENV PATH=/home/${USER}/.composer/vendor/bin:$PATH
