# Use a minimal Ubuntu base image
FROM ubuntu:20.04

# Copy the server files to the container
WORKDIR /mc-server
COPY ./mc-server /mc-server

ENV SERVER_PORT=19132

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    libcurl4 \
    libssl1.1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose the default Bedrock server port
EXPOSE ${SERVER_PORT}

# Ensure the server starts on container run
CMD ["sh", "-c", "LD_LIBRARY_PATH=. ./bedrock_server"]
