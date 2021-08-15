#!/bin/bash

# 参考: https://qiita.com/gzock/items/e0225fd71917c234acce

export DYNAMO_ENDPOINT=http://localhost:8000

docker run -d -p 8000:8000 amazon/dynamodb-local -jar DynamoDBLocal.jar -inMemory -sharedDb

dynamodb-admin & # バックグランド
