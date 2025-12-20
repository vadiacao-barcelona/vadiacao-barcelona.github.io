# syntax=docker/dockerfile:1.5
FROM ruby:3.2.6-slim

ENV LANG C.UTF-8
ENV BUNDLE_PATH /gems
ENV BUNDLE_JOBS 4
ENV GEM_HOME /gems

# keep layer small, install build deps for native gems
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    curl \
    libssl-dev \
    libyaml-dev \
    zlib1g-dev \
    libgdbm-dev \
    libreadline-dev \
    pkg-config \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

# copy gemspec and Gemfile first for caching
COPY *.gemspec ./
COPY Gemfile Gemfile.lock* ./

# install bundler then bundle install
RUN gem install bundler -v "2.4.15" --no-document || gem install bundler --no-document
RUN bundle install --jobs 4 --retry 3

# copy the rest of the site
COPY . .

# Expose default Jekyll dev port
EXPOSE 4000

# Default command: start jekyll serve in safe mode for local dev;
# override in docker-compose or with `docker run ... <cmd>`
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch", "--force_polling"]
