#!/bin/bash

BASE_URL=$1

export TS_NODE_PROJECT='./tests/e2e/tsconfig.json'
npx codeceptjs run \
  --config ./codecept.conf.js \
  --override "{ \"helpers\": { \"Puppeteer\": { \"url\": \"$BASE_URL\" } } }" \
  --steps \
  --reporter mocha-multi
