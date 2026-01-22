# Use the latest Debian minimal image
FROM debian:stable-slim

# Set working directory
WORKDIR /app

# Copy setup.sh into the container
COPY setup.sh ./

# Make setup.sh executable and run it
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    chmod +x setup.sh && ./setup.sh

# Default command (can be changed as needed)
ENTRYPOINT [ "./code" ]

CMD [ "serve-web", "--host", "0.0.0.0", "--accept-server-license-terms" ]