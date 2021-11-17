FROM public.ecr.aws/bitnami/minideb:buster AS deps

WORKDIR /depsdir
USER root

RUN apt update && \
    apt -y install --no-install-recommends \
    php \
    php-zip \
    php-curl \
    unzip \
    git \
    curl
COPY --from=docker.io/library/composer /usr/bin/composer /usr/bin/composer
COPY ./composer.json ./
RUN composer update \
    --ignore-platform-reqs \
	--no-ansi \
	--no-interaction \
	--no-plugins \
	--no-progress \
	--no-scripts \
	--prefer-dist \
    --optimize-autoloader

FROM docker.io/library/php:cli AS deploy

WORKDIR /tmp
USER root

COPY --chown=root:root --from=deps /depsdir/vendor ./vendor
COPY --chown=root:root ./ .
