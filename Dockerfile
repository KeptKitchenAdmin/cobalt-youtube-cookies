FROM ghcr.io/imputnet/cobalt:latest

# Just set the environment variable - let's test if cobalt can work without cookies first
ENV COOKIE_PATH=/cookies.json

# The cookies will need to be provided a different way