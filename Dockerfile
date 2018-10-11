FROM heroku/heroku:18-build

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn tmux
RUN curl -J -L https://github.com/DarthSim/overmind/releases/download/v1.2.1/overmind-v1.2.1-linux-amd64.gz | \
    gunzip -c > /usr/local/sbin/overmind && chmod +x /usr/local/sbin/overmind
RUN gem install bundler && bundle config silence_root_warning true
RUN curl https://cli-assets.heroku.com/install.sh | sh

ARG PORT
ENV PORT $PORT

WORKDIR /app
COPY Gemfile* ./
RUN bundle && yarn
