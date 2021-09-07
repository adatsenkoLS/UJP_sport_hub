FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm
RUN npm install -g yarn 
WORKDIR /UJP_SPORT_HUB
COPY Gemfile /UJP_SPORT_HUB/Gemfile
COPY Gemfile.lock /UJP_SPORT_HUB/Gemfile.lock
RUN gem install bundler
RUN bundle install
RUN rails assets:precompile


# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]