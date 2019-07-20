#!/bin/bash

# Creating the deployment app
sudo kubectl apply -f deployment.yaml

# Creating helloworld kubernet service
sudo kubectl apply -f service.yaml

# Creating Ingress for helloworld service
sudo kubectl apply -f ingress.yaml
