FROM ruby:2.4.3-alpine

RUN apk update && apk upgrade && \
    apk add --virtual build-dependencies build-base postgresql-dev \
    libxml2-dev libxslt-dev tzdata curl wget bash git vim && \
    apk add ruby-io-console ruby-bundler ruby-dev build-base $BUILD_PACKAGES && \
    apk del build-dependencies

RUN set -ex && apk add --no-cache libpq ca-certificates openssl

RUN rm -rf /var/cache/apk/*

RUN mkdir /app/
WORKDIR /app/

COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install -j 20

COPY . .

RUN set -ex \
  && apk add --no-cache --virtual .app-builddeps nodejs=6.2.0-r0

RUN chown -R nobody:nogroup .
USER nobody

RUN setlo
