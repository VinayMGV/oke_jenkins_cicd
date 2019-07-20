#!/bin/bash

# Creating the deployment app
sudo kubectl apply -f CDPipe/deployment.yaml

# Creating appflask kubernet service
sudo kubectl apply -f CDPipe/service.yaml
