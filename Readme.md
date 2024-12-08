# Minecraft Server for Linux

This is a docker setup to start a minecraft bedrock server inside a docker container

## Table-of-Contents

- [Dependencies](#dependencies)
- [Quickstart](#quickstart)
- [Install](#install)
- [Start server](#start-server)
- [Check server](#check-server)

## Dependencies

- **`git`**: Used to download this repository.
- **`curl`**: Used to download the linux bedrock server.
- **`unzip`**: Used to unpack the download.
- **`docker-compose`**: Used to build and run the server inside a docker container.
- **`python`**: Used to check if server is online.

## Quickstart

### Install

```bash
# Clone repository and navigate in folder.
git clone https://github.com/mihaiandreineacsu/minecraft-server.git
cd minecraft-server

# Download server, unzip it and remove the zip.
curl -o bedrock-server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.10.01.zip && \      # Download using curl.
    unzip bedrock-server.zip -d ./mc-server && \     # Unzip to mc-server.
    rm bedrock-server.zip                           # Delete the zip file.
```

### Start server

> [!Note] Default host port binding is `8888`.

> You can adjust this in `docker-compose.yaml` file to fit your needs.

```bash
# Runs a docker container and automatically starts the server
docker-compose up --build -d
```

## Check server

You can check if your minecraft server started by running the `test_bedrock.py` script.

1. Install `mcstatus==11.1.1` package used by the script to check your bedrock server status.

```bash
pip install mcstatus==11.1.1
```

1. Run the script.

```bash
python test_bedrock.py <your_server_address>  # Example localhost:19132
```
