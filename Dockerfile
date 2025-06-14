FROM ghcr.io/imputnet/cobalt:latest

# Switch to root temporarily
USER root

# Add startup script with correct permissions and shebang
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Set environment variables with defaults
ENV COOKIE_PATH=/app/cookies.json
ENV PORT=9000

# Switch back to the original user (check what user the base image uses)
USER 1000

# Set working directory to match base image
WORKDIR /app

# Use absolute path for entrypoint
ENTRYPOINT ["/usr/local/bin/startup.sh"]