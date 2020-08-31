FROM ruby:2.6.0

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN apt-get install -y nodejs


ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler:2.1.4

ADD Gemfile* $APP_HOME/
RUN bundle install

# ADD yarn.lock $APP_HOME/
# RUN yarn install --check-files

ADD . $APP_HOME

ENV PORT 5000
EXPOSE 5000

RUN mv config/database.yml.docker config/database.yml

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
