FROM ghcr.io/imputnet/cobalt:latest

# Stay as root for the entire process since USER 1000 can't access root files
USER root

# Copy startup script and make executable
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Create placeholder cookies.json in the working directory
RUN echo '{"youtube": [""]}' > /app/cookies.json
RUN chown 1000:1000 /app/cookies.json

# Environment variables
ENV COOKIE_PATH=/app/cookies.json

# Set working directory
WORKDIR /app

# Use startup script as entrypoint with full path
ENTRYPOINT ["/usr/local/bin/startup.sh"]