# Use OpenJDK 21 image as base
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /server

# Copy server files and make init.sh executable in one step
COPY server/server.jar init.sh ${WORKDIR}/
COPY .env $WORKDIR/server.properties
RUN chmod +x init.sh

# Expose the default Minecraft server port
EXPOSE 25565

# Set the entry point to run the init.sh script with memory parameters
ENTRYPOINT ["/server/init.sh"]
