FROM shanesveller/phoenix-framework:latest

COPY . /usr/src/app
RUN node_modules/brunch/bin/brunch build --production
RUN mix do compile

ENV PORT 4001
EXPOSE 4001
CMD ["mix","phoenix.server"]
