# Minecraft Server for Linux

This is a docker setup to start a minecraft bedrock server inside a docker container.

---

## Table-of-Contents

- [Structure](#structure)
- [Dependencies](#dependencies)
- [Quickstart](#quickstart)
- [Install](#install)
- [Start server](#start-server)
- [Environment Variables Table](#environment-variables-table)
- [Check server](#check-server)

---

## Structure

- [bedrock.Dockerfile](./bedrock.Dockerfile): An ubuntu base image that copies the bedrock server, the server properties template and the entrypoint script from host. Installs dependencies required by bedrock server to run properly. Declares `SERVER_PORT` environment variable with default value of `19132` and expose this to host.
- [Docker Compose.md](./Docker%20Compose.md): A guide how to install **docker-compose** in Linux.
- [docker-compose.yaml](./docker-compose.yaml): Builds the `bedrock.Dockerfile` image named `mc-server`. Binds host port `8888` to docker container `19132` port. Copies `.env` file containing server properties values. Creates a volume named `mc-server-volume` and binds it to docker container `/mc-server` folder.
- [docker-entrypoint.sh](./docker-entrypoint.sh): Entrypoint to docker container. Substitutes environment variables from [server.properties.template](./server.properties.template) file to `server.properties` file.
- [server.properties.template](./server.properties.template): Copied to docker container, this files is then used in entrypoint to substitute environments variable to bedrock server properties.
- [template.env](./template.env): Contains default environment variables for server configuration.
- [test_bedrock.py](./test_bedrock.py): Python script, useful to test if the bedrock server is online.

---

## Dependencies

- **`git`**: Used to download this repository.
- **`curl`**: Used to download the linux bedrock server.
- **`unzip`**: Used to unpack the download.
- **`docker`**: Used for docker container runtime.
- **`docker-compose`**: Used to build and run the server inside a docker container.
- **`python`**: Used to check if server is online.

---

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

### Define environments

Create a `.env` file in root location of the project and paste it the content of [template.env](./template.env) file.

```bash
cat template.env > .env
```

> [!Note] The [template.env](./template.env) contains defaults values. You can change them in your `.env` file to fit your needs. See the [Environment Variables Table](#environment-variables-table) for details.

### Build Docker Image

Run this command to create a docker image with tag name `mc-server`.

```bash
docker build \  # Main Command to create a docker image
    -t mc-server \  # Tags the Docker Image as `mc-server:latest`
    -f bedrock.Dockerfile \  # Explicitly given dockerfile to use
    .  # Specifies the current directory as the build context
```

### Start server

> [!Note] Default port binding is port `8888` for host and `19132` for container. You can adjust this in `docker-compose.yaml` file to fit your needs.

```bash
# Runs a docker container that automatically starts the server
docker-compose up -d
```

---

## Environment Variables Table

> [!Note] This Table lists only the properties that needs more attention to this repository set up. For more details of all properties see this link <https://minecraft.fandom.com/wiki/Server.properties#Bedrock_Edition>

| Name | Description | Default | Type |
| :--- | :--- | :---: | :---: |
| `SERVER_PORT` | The port the server should listen to. Same as in `docker-compose.yaml` file. | 19132 | int |
| `LD_LIBRARY_PATH` | Folder location of the bedrock server. Same as in `bedrock.Dockerfile` **WORKDIR** and in `docker-compose.yaml` volume binding.   | "/mc-server" | string |

---

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
