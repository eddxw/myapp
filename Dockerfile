FROM ruby:2.6
LABEL maintainer="eduardo.jemb@gmail.com"

# Allow apt to work with https-based sources      
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

# Ensure we install an up-to-date version of Node
# See https://github.com/yarnpkg/yarn/issues/2888
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -  
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list

# Install packages
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  yarn

# START: final-part-after-javascript-stuff
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

# START_HIGHLIGHT
ENV BUNDLE_PATH /gems
# END_HIGHLIGHT

RUN bundle install

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
# END: final-part-after-javascript-stuff