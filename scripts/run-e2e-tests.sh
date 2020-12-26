#!/bin/bash -e

base_url=$1
path_to_chromium=$2

export TS_NODE_PROJECT=./tests/e2e/tsconfig.json
npx codeceptjs run \
  --config ./codecept.json \
  --override "{ \"helpers\": { \"Puppeteer\": { \"url\": \"$base_url\", \"chrome\": { \"executablePath\": \"$path_to_chromium\" } } } }" \
  --steps \
  --reporter mocha-multi
