#!/bin/bash
set -e

# Load environment variables from .env file
if [ -f .env ]; then
  set -a
  source .env
  set +a
  
  # Debug: Print the value of MODELS_DIR
  echo "MODELS_DIR: ${MODELS_DIR}"
fi

docker build -t civitai-image .

if [ -z "${MODELS_DIR}" ]; then
  echo "Error: MODELS_DIR is not set. Please set it in the .env file."
  exit 1
fi

docker run --name civitai-container -v $(pwd):/home/civitaiuser -v ${MODELS_DIR}:/home/civitaiuser/models -e LC_ALL=C.UTF-8 -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH -e PATH=$PATH:/home/civitaiuser/.local/bin -it civitai-image zsh
