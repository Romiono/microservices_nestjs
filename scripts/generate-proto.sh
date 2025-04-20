#!/bin/bash

PROTO_DIR=../proto
OUT_DIR=../packages

for SERVICE in user catalog order; do
  mkdir -p $OUT_DIR/${SERVICE}-service/src/proto
  protoc --plugin=./node_modules/.bin/protoc-gen-ts_proto \
    --ts_proto_out=$OUT_DIR/${SERVICE}-service/src/proto \
    --ts_proto_opt=nestJs=true \
    -I=$PROTO_DIR $PROTO_DIR/${SERVICE}.proto
done