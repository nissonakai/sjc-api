FROM ruby:2.6.3-alpine

ENV LANG C.UTF-8
ENV ROOT 3000

ENV APP_ROOT /usr/src/app
WORKDIR $APP_ROOT

RUN apk update && \
    apk --update --no-cache add \
    shadow \
    sudo \
    busybox-suid \
    mariadb-connector-c-dev \
    tzdata \
    alpine-sdk \
    postgresql-client \
    postgresql-dev \
    nodejs && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  bundle config --global jobs 4 && \
  bundle install && \
  rm -rf ~/.gem


COPY . $APP_ROOT

CMD ["bundle", "exec", "rails", "s", "puma", "-b", "0.0.0.0"]
