FROM ruby:2.7.2
ENV RUBYOPT -EUTF-8

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get update && apt-get install -y build-essential default-mysql-client

RUN mkdir /project
ENV APP_ROOT /project
WORKDIR $APP_ROOT

ENV BUNDLE_PATH=$APP_ROOT/vendor/bundle

ADD . $APP_ROOT
