FROM ghcr.io/imputnet/cobalt:latest

# Switch to root temporarily to set permissions
USER root

# Add startup script to the app directory with correct permissions
COPY --chmod=755 startup.sh /app/startup.sh

# Set environment variables with defaults
ENV COOKIE_PATH=/app/cookies.json
ENV PORT=9000

# Switch back to the original user
USER 1000

# Set working directory
WORKDIR /app

# Use our startup script as entrypoint
ENTRYPOINT ["./startup.sh"]