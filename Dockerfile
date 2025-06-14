FROM ghcr.io/imputnet/cobalt:latest

# Environment variables (API_URL should be set in Render dashboard)  
ENV COOKIE_PATH=/cookies.json

# Create a simple cookies.json at build time (will be overridden at runtime)
RUN echo '{"youtube": [""]}' > /cookies.json