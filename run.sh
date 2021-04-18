#!/bin/bash

docker container rm -f proxy > /dev/null 2>&1 || {
    echo "Error while removing existing container."
    exit 1
}

bash -c "docker run -d \
        --restart always \
        --name proxy \
        -p 80:80 \
        -v "$PWD"/default.conf:/etc/nginx/conf.d/default.conf \
        proxy" || {
    echo "Error while running container."
    exit 2
}