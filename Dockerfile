FROM ruby:2.5.5

# install system libraries
RUN apt-get update -yqq \
  && apt-get install -yqq build-essential libpq-dev nodejs qt5-default \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

# install path setup
ENV INSTALL_PATH /abhinav-nepal
RUN mkdir -p $INSTALL_PATH

# install gems
COPY Gemfile* ./
RUN bundle install
COPY . .

CMD bin/start-up
