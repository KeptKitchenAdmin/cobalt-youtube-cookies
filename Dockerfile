FROM ghcr.io/imputnet/cobalt:latest

# Copy startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Environment variables (API_URL should be set in Render dashboard)
ENV COOKIE_PATH=/cookies.json

# Use startup script
ENTRYPOINT ["/startup.sh"]