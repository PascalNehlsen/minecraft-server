# Minecraft Server with Docker Compose

## Table of Contents

1. [Description](#description)
2. [Quickstart](#quickstart)
3. [Configuration](#configuration)
4. [Contact](#contact)

## Description

This repository contains a Docker setup for running a Minecraft server using Docker Compose. The setup provides a simple and efficient way to launch and manage a Minecraft server with customizable configurations, such as memory allocation, maximum players, and more.

### Prerequisites

To use this repository, you need to have the following installed:

- [Docker](https://www.docker.com/products/docker-desktop)

Docker Compose has been integrated into Docker as a plugin as of Docker version 20.10.
If not, [visit official Docker Docs](https://docs.docker.com/compose/install/) to install Docker compose manually.

## Quickstart

1. Clone this repository:

   ```bash
   git clone https://github.com/PascalNehlsen/minecraft-server
   cd minecraft-server
   ```

2. Copy the content of the example env file into a .env file:

   ```bash
   cp example_env .env
   ```

3. Build the Docker image and Start the Minecraft server container:

   ```bash
   docker-compose up --build
   ```

4. Access your Minecraft server:

   - Open Minecraft and connect to `localhost:8888` (or use your server's IP if hosted remotely).

5. To stop the server, run:

   ```bash
   docker-compose down
   ```

## Configuration

Here are the available environment variables you can configure in the [.example_env](./.example_env) file:

- `MAX_PLAYERS`: The maximum number of players allowed on the server. Default: `10`.
- `MOTD`: The "Message of the Day" that players see when they join the server.
- `DIFFICULTY`: The difficulty level for the server. Default:`normal` | Options: `easy`, `normal`, `hard`.
- `GAMEMODE`: The default game mode for players when they join. Default:`survival` | Options: `survival`, `creative`, `adventure`, `spectator`.
- `ONLINE_MODE`: Whether the server should authenticate players using Minecraft’s online services. Default: `true`.

## Contact

- Pascal Nehlsen - [LinkedIn](https://www.linkedin.com/in/pascal-nehlsen) - [mail@pascal-nehlsen.de](mailto:mail@pascal-nehlsen.de)
- Project Link: [https://github.com/PascalNehlsen/minecraft-server](https://github.com/PascalNehlsen/minecraft-server)
