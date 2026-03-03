FROM ruby:3.2-slim-bookworm

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      libpq-dev \
      libyaml-dev \
      postgresql-client \
      git \
      curl \
      gnupg2 && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install --no-install-recommends -y nodejs && \
    npm install -g yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rails

# Install bundler to match Gemfile.lock
RUN gem install bundler -v 2.6.2

# Install Ruby dependencies (layer cached)
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Install JS dependencies (layer cached)
COPY package.json yarn.lock ./
RUN yarn install

# Copy application code
COPY . .

# Build JS and CSS assets
RUN yarn build && yarn build:css

# Entrypoint handles DB setup
COPY bin/docker-entrypoint /rails/bin/docker-entrypoint
RUN chmod +x /rails/bin/docker-entrypoint

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000

CMD ["./bin/dev"]
