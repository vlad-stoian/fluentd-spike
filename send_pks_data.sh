#! /usr/bin/env bash

set -e
# set -x

for i in `seq 30`; do
  cluster_id="$(uuidgen)"
  number_of_workers="$(od -An -N1 -i /dev/random | tr -d ' \n')"
  plan_id="$(uuidgen)"
  timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

  curl -X POST -d "json={ \"eventType\":\"create_cluster\", \"data\": { \"cluster_id\": \"$cluster_id\", \"number_of_workers\": \"$number_of_workers\", \"plan_id\": \"$plan_id\", \"plan_name\": \"minimum\", \"timestamp\": \"$timestamp\", \"user_id\": \"1324676999ba855eab15118db74837089eced8c5b3ab39837b8fd1bf829861ac\" }" http://10.0.8.12:8888/pks-api
done
