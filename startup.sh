#!/bin/bash

echo "🚀 Starting Cobalt with YouTube Cookies"

# Write cookies from environment variable to file
if [ ! -z "$YOUTUBE_COOKIES_JSON" ]; then
    echo "🍪 Writing YouTube cookies to /app/cookies.json..."
    echo "$YOUTUBE_COOKIES_JSON" > /app/cookies.json
    echo "✅ Cookies written successfully"
else
    echo "⚠️  No YOUTUBE_COOKIES_JSON environment variable found"
fi

echo "🎬 Starting Cobalt API server..."

# Start cobalt normally  
exec node src/cobalt