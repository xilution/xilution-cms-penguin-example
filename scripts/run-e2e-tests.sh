#!/bin/bash

BASE_URL=$1

docker-compose up --build -d
bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8080)" != "200" ]]; do sleep 5; done'
export TS_NODE_PROJECT='./tests/e2e/tsconfig.json'
npx codeceptjs run -o "{ \"helpers\": { \"Puppeteer\": { \"url\": \"$BASE_URL\" } } }" --steps --reporter mocha-multi
docker-compose down
