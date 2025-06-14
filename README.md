# Cobalt YouTube Cookies Docker Image

Custom Docker image for Cobalt that supports YouTube authentication via environment variables.

## What This Solves

- **Problem**: Official Cobalt Docker image expects `cookies.json` file to exist
- **Solution**: This image creates `cookies.json` from environment variables at startup

## Environment Variables

### Required
- `YOUTUBE_COOKIES_JSON`: Your YouTube cookies formatted as JSON string

### Optional  
- `COOKIE_PATH`: Path to cookies file (default: `/app/cookies.json`)
- `API_URL`: Your Cobalt instance URL
- `PORT`: Port to run on (default: `9000`)

## Cookie Format

The `YOUTUBE_COOKIES_JSON` should be formatted as JSON:
```json
{"youtube": ["LOGIN_INFO=value; HSID=value; SSID=value; SID=value; APISID=value; SAPISID=value"]}
```

## Usage

### Docker Run
```bash
docker run -p 9000:9000 \
  -e YOUTUBE_COOKIES_JSON='{"youtube": ["your-cookie-string-here"]}' \
  your-registry/cobalt-youtube-cookies:latest
```

### Docker Compose
```yaml
version: '3.8'
services:
  cobalt:
    image: your-registry/cobalt-youtube-cookies:latest
    ports:
      - "9000:9000"
    environment:
      - YOUTUBE_COOKIES_JSON={"youtube": ["your-cookie-string-here"]}
      - COOKIE_PATH=/app/cookies.json
```

### Render Deployment

1. Connect this repository to Render
2. Set up environment variables:
   - `YOUTUBE_COOKIES_JSON`: Your cookie JSON string
   - `API_URL`: Your Render app URL
3. Deploy!

## Testing

After deployment, test with:
```bash
curl -X POST "https://your-instance.com/" \
  -H "Content-Type: application/json" \
  -d '{"url": "https://www.youtube.com/watch?v=dQw4w9WgXcQ"}'
```

Should return `"status": "tunnel"` with working proxy URL.

## Troubleshooting

Check logs for:
- `✅ Cookies written successfully` - confirms cookies are loaded
- `⚠️ No YOUTUBE_COOKIES_JSON environment variable found` - missing environment variable
- YouTube authentication errors - cookies may have expired