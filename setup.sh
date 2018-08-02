#! /usr/bin/env bash

set -e

bosh -d fluentd-test deploy fluentd-on-bosh.yml
bosh -d fluentd-test scp enveloper.rb :/tmp/ || true

kubectl delete -f fluent-bit-on-k8s-deployment.yml
kubectl apply -f fluent-bit-on-k8s-deployment.yml
