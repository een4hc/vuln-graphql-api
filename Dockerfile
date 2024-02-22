FROM node:14.12.0-buster

ARG SERVER_PORT=3000
ENV SERVER_PORT=${SERVER_PORT}
EXPOSE ${SERVER_PORT}:${SERVER_PORT}

RUN apt update && apt upgrade -y
RUN useradd -m app
COPY --chown=app ./app /graphql
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
WORKDIR /graphql

USER app
ENTRYPOINT [ "docker-entrypoint.sh" ]
