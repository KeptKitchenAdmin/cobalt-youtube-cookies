FROM ghcr.io/imputnet/cobalt:latest

# Add startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Set environment variables with defaults
ENV COOKIE_PATH=/cookies.json
ENV PORT=9000

# Use our startup script as entrypoint
ENTRYPOINT ["/startup.sh"]