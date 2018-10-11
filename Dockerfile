FROM heroku/heroku:18-build

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
RUN gem install bundler && bundle config silence_root_warning true
RUN curl https://cli-assets.heroku.com/install.sh | sh

ARG PORT
ENV PORT $PORT

WORKDIR /app
COPY Gemfile* ./
RUN bundle && yarn
