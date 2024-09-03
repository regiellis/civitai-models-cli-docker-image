#!/bin/bash
set -e

docker build -t civitai-image .
docker run --name civitai-container -v $(pwd):/home/civitaiuser -v ${MODELS_DIR}:/home/civitaiuser/models -e LC_ALL=C.UTF-8 -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH -e PATH=$PATH:/home/civitaiuser/.local/bin -it civitai-image zsh
