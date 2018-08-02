#! /usr/bin/env bash

set -e

# bosh -d fluentd deploy fluentd-on-bosh.yml

kubectl delete -f fluent-bit-on-k8s-deployment.yml
kubectl apply -f fluent-bit-on-k8s-deployment.yml
