FROM bitwalker/alpine-elixir-phoenix as builder

COPY . /app
WORKDIR /app

RUN mix do deps.get, deps.compile

RUN mix deps.get
RUN mix compile
RUN cd apps/my_app_web/assets && \
    # Needed b/c I npm-installed on OSx, not Linux
    npm rebuild node-sass && \
    npm install && \
    node ./node_modules/webpack/bin/webpack.js --mode development

# run phoenix server. The CMD is run each time the container is launched.
CMD mix phx.server
