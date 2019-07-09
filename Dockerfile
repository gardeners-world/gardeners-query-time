FROM ruby:2.6-slim

RUN apt-get update && apt-get install -y build-essential

COPY gqt/gems.rb /opt/gqt/
WORKDIR /opt/gqt
RUN bundle install

COPY gqt/ /opt/gqt
