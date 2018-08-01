#! /usr/bin/env bash

set -e

kubectl delete -f deployment.yml
kubectl apply -f deployment.yml
