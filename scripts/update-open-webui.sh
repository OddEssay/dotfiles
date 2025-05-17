#!/bin/zsh

docker stop open-webui
docker rm open-webui
docker pull ghcr.io/open-webui/open-webui:main
docker run -d \
    -p 4444:8080 \
    --add-host=host.docker.internal:host-gateway \
    --name open-web-ui  \
    -v open-webui:/app/backend/data \
    --restart always \
    ghcr.io/open-webui/open-webui:main
