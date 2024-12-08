# Docker Compose (Linux)

This is a guide how to install docker-compose on linux.

## System Details

- OS: Ubuntu 22.04 LTS
- Architecture: x86_64 (64-bit Intel/AMD processor)

## Required Docker Compose Binary

You need the `docker-compose-linux-x86_64` binary.

---

## Download and Install Docker Compose

1. Download the Binary Run the following commands to download the appropriate version:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
```

1. Make It Executable

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

1. Verify Installation

```bash
docker-compose version
```
