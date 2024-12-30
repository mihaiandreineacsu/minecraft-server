# Use a minimal Ubuntu base image
FROM ubuntu:20.04

# Copy the server files to the container
WORKDIR /mc-server
COPY ./mc-server /mc-server
COPY ./server.properties.template /mc-server
COPY ./docker-entrypoint.sh /mc-server

ENV SERVER_PORT=19132

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    libcurl4 \
    libssl1.1 \
    gettext-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x docker-entrypoint.sh

# Expose the default Bedrock server port
EXPOSE ${SERVER_PORT}

ENTRYPOINT [ "/mc-server/docker-entrypoint.sh" ]
