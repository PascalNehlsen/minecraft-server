#!/bin/bash

# Server path variable
SERVER_DIR="/server"

# Exit immediately if any command fails
set -o errexit

# Load the .env file if it exists
if [ -f "${SERVER_DIR}/.env" ]; then
    echo "Loading environment variables from .env file..."
    set -a
    source "${SERVER_DIR}/.env"
    set +a
else
    echo ".env file not found, using default values"
fi

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "Java could not be found! Please install Java."
    exit 1
fi

# Check if the server.properties file exists, if not, create it
if [ ! -f "${SERVER_DIR}/server.properties" ]; then
    echo "Creating server.properties..."

    # Dynamically create the content for the server.properties file
    cat <<EOL > "${SERVER_DIR}/server.properties"
# Minecraft Server Properties

# General Settings
motd=${MOTD:-"Welcome to Pascal's Minecraft Server!"}
max-players=${MAX_PLAYERS:-15}
gamemode=${GAMEMODE:-"creative"}
difficulty=${DIFFICULTY:-"easy"}
online-mode=${ONLINE_MODE:-true}
EOL
fi

# Check if eula.txt exists, if not, create and agree to the EULA
if [ ! -f "${SERVER_DIR}/eula.txt" ]; then
    echo "Creating eula.txt and agreeing to the EULA..."
    echo "eula=true" > "${SERVER_DIR}/eula.txt"
fi

# Ensure that server.jar exists
if [ ! -f "${SERVER_DIR}/server.jar" ]; then
    echo "server.jar not found! Please check the path."
    exit 1
fi

# Start the Minecraft server
echo "Starting the Minecraft server..."
exec java -Xmx${MEMORY:-2G} -Xms${MEMORY:-1G} -jar "${SERVER_DIR}/server.jar" nogui
