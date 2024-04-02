#!/bin/bash
set -e

create_resources() {
    kubectl create -f voting-app-deploy.yaml
    kubectl create -f voting-app-service.yaml

    kubectl create -f redis-deploy.yaml
    kubectl create -f redis-service.yaml

    kubectl create -f postgres-deploy.yaml
    kubectl create -f postgres-service.yaml

    kubectl create -f worker-app-deploy.yaml

    kubectl create -f result-app-deploy.yaml
    kubectl create -f result-app-service.yaml
}

delete_resources() {
    kubectl delete -f voting-app-deploy.yaml
    kubectl delete -f voting-app-service.yaml

    kubectl delete -f redis-deploy.yaml
    kubectl delete -f redis-service.yaml

    kubectl delete -f postgres-deploy.yaml
    kubectl delete -f postgres-service.yaml

    kubectl delete -f worker-app-deploy.yaml

    kubectl delete -f result-app-deploy.yaml
    kubectl delete -f result-app-service.yaml
}

if [ "$1" == "create" ]; then
    create_resources
elif [ "$1" == "delete" ]; then
    delete_resources
else
    echo "Invalid argument. Please use 'create' or 'delete'."
    exit 1
fi