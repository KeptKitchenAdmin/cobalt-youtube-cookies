FROM ghcr.io/imputnet/cobalt:latest

# Switch to root to create files
USER root

# Create a simple cookies.json in app directory
RUN echo '{"youtube": [""]}' > /app/cookies.json

# Environment variables (API_URL should be set in Render dashboard)  
ENV COOKIE_PATH=/app/cookies.json

# Switch back to original user
USER 1000