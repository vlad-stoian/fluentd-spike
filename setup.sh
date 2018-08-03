#! /usr/bin/env bash

set -e

bosh -n -d fluentd-test deploy fluentd-on-bosh.yml
bosh -n -d fluentd-test scp enveloper.rb :/tmp/ || true
bosh -n -d fluentd-test scp sender.rb :/tmp/ || true

kubectl delete -f fluent-bit-on-k8s-deployment.yml
kubectl apply -f fluent-bit-on-k8s-deployment.yml
