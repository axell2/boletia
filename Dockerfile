FROM ruby:3.2.2

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config

RUN gem install bundler -v 2.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install 

RUN bundle update
COPY . ./ 

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]