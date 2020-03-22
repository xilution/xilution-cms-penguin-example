#!/bin/bash

BASE_URL=$1

mkdir -p ./output/load
npx artillery run \
  --config ./artillery.conf.yaml \
  --output ./output/load/report.json \
  --overrides "{ \"config\": { \"target\": \"$BASE_URL\" } }" \
  ./tests/load/scenarios.yaml
npx artillery report \
  --output ./output/load/report.html \
  ./output/load/report.json
