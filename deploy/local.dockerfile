FROM node:8.5.0-alpine
ENV NODE_ENV local
RUN mkdir -p /code
WORKDIR /code

COPY . /code

RUN apk add --no-cache --update bash && \
  npm install
CMD dockerize -wait tcp://example-api-db:27017 sh -c "npm run start"
