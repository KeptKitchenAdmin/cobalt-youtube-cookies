FROM ghcr.io/imputnet/cobalt:latest

# Switch to root to add startup script
USER root

# Copy startup script to root and make executable
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Create placeholder cookies.json (will be overwritten by startup script)
RUN echo '{"youtube": [""]}' > /app/cookies.json

# Environment variables (API_URL should be set in Render dashboard)  
ENV COOKIE_PATH=/app/cookies.json

# Switch back to original user
USER 1000

# Set working directory
WORKDIR /app

# Use startup script as entrypoint
ENTRYPOINT ["/startup.sh"]