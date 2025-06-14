FROM ghcr.io/imputnet/cobalt:latest

# Switch to root temporarily
USER root

# Environment variables
ENV COOKIE_PATH=/app/cookies.json

# Create a simple shell wrapper that writes cookies then starts cobalt
RUN echo '#!/bin/sh' > /start.sh && \
    echo 'echo "🚀 Starting Cobalt with YouTube Cookies"' >> /start.sh && \
    echo 'if [ ! -z "$YOUTUBE_COOKIES_JSON" ]; then' >> /start.sh && \
    echo '  echo "🍪 Writing YouTube cookies to /app/cookies.json..."' >> /start.sh && \
    echo '  echo "$YOUTUBE_COOKIES_JSON" > /app/cookies.json' >> /start.sh && \
    echo '  echo "✅ Cookies written successfully"' >> /start.sh && \
    echo 'else' >> /start.sh && \
    echo '  echo "⚠️  No YOUTUBE_COOKIES_JSON environment variable found"' >> /start.sh && \
    echo 'fi' >> /start.sh && \
    echo 'echo "🎬 Starting Cobalt API server..."' >> /start.sh && \
    echo 'exec node src/cobalt' >> /start.sh && \
    chmod +x /start.sh

# Create placeholder cookies.json
RUN echo '{"youtube": [""]}' > /app/cookies.json

# Set working directory
WORKDIR /app

# Use our shell wrapper
ENTRYPOINT ["/start.sh"]