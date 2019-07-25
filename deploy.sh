#!/bin/bash

GIT_COMMIT=$(cat /tmp/git_commit)
REPO_PATH=$(cat /tmp/repo)

# replacing the current GIT_COMMIT to pull the image
sudo sed -i "s/$REPO_PATH\/app_flask:.*/$REPO_PATH\/app_flask\:$GIT_COMMIT/" CDPipe/deployment.yaml

# Creating the deployment app
sudo kubectl apply -f CDPipe/deployment.yaml

# Creating appflask kubernet service
sudo kubectl apply -f CDPipe/service.yaml

# Removing the files
sudo rm -f /tmp/git_commit
sudo rm -f /tmp/repo