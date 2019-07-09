FROM ruby:2.6-slim

COPY gqt/gems.rb /opt/gqt/
WORKDIR /opt/gqt
RUN bundle install

COPY gqt/ /opt/gqt
