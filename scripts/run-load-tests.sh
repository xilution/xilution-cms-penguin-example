#!/bin/bash

BASE_URL=$1

docker-compose up --build -d
bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8080)" != "200" ]]; do sleep 5; done'
mkdir -p ./output/load
npx artillery run --output ./output/load/report.json --overrides "{ \"config\": { \"target\": \"$BASE_URL\" } }" ./tests/load/landing.yaml
npx artillery report --output ./output/load/report.html ./output/load/report.json
docker-compose down
