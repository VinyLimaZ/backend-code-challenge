FROM ruby:2.4.3-slim

RUN  apt-get update -y && apt-get install openssl libpq-dev \
    build-essential postgresql libxml2-dev libxslt-dev tzdata curl \
    wget bash git vim git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y


RUN mkdir /app/
WORKDIR /app/

COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install

COPY . .
