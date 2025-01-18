#!/bin/bash

set -e

if [ $# -ne 2 ]; then
  echo "Usage: $0 <github-repo> <dockerhub-repo>"
  echo "Example: $0 mluukkai/express_app mluukkai/testing"
  exit 1
fi

GITHUB_REPO=$1
DOCKERHUB_REPO=$2

REPO_NAME=$(basename "$GITHUB_REPO")

echo "Cloning repository: https://github.com/$GITHUB_REPO.git"
git clone "https://github.com/$GITHUB_REPO.git" || { echo "Failed to clone repository"; exit 1; }

cd "$REPO_NAME" || { echo "Failed to enter repository directory"; exit 1; }

echo "Building Docker image: $DOCKERHUB_REPO"
docker build -t "$DOCKERHUB_REPO" . || { echo "Docker build failed"; exit 1; }

echo "Pushing Docker image to Docker Hub: $DOCKERHUB_REPO"
docker push "$DOCKERHUB_REPO" || { echo "Docker push failed"; exit 1; }

echo "Done! Docker image published to $DOCKERHUB_REPO"
