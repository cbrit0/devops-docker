#!/bin/bash

set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <dockerhub-repo>"
  echo "Example: $0 mluukkai/testing"
  exit 1
fi

DOCKERHUB_REPO=$1

# Login to Docker Hub
echo "Logging in to Docker Hub..."
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin || { echo "Docker login failed"; exit 1; }

echo "Building Docker image: $DOCKERHUB_REPO"
docker build -t "$DOCKERHUB_REPO" . || { echo "Docker build failed"; exit 1; }

echo "Pushing Docker image to Docker Hub: $DOCKERHUB_REPO"
docker push "$DOCKERHUB_REPO" || { echo "Docker push failed"; exit 1; }

echo "Done! Docker image published to $DOCKERHUB_REPO"
