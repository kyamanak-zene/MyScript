#!/bin/bash

export TABLE_NAME=bmi_prs_result
export DYNAMO_ENDPOINT=http://localhost:8000

# テーブル作成
# aws dynamodb create-table --table-name $TABLE_NAME --attribute-definitions '[{"AttributeName": "iid","AttributeType": "S"},{"AttributeName": "score1_avg","AttributeType": "N"}]' --key-schema '[{"AttributeName": "iid","KeyType": "HASH"},{"AttributeName": "score1_avg","KeyType": "RANGE"}]' --provisioned-throughput '{"ReadCapacityUnits": 5,"WriteCapacityUnits": 5}' --endpoint-url $DYNAMO_ENDPOINT
aws dynamodb create-table --table-name $TABLE_NAME --attribute-definitions '[{"AttributeName": "iid","AttributeType": "S"}]' --key-schema '[{"AttributeName": "iid","KeyType": "HASH"}]' --provisioned-throughput '{"ReadCapacityUnits": 5,"WriteCapacityUnits": 5}' --endpoint-url $DYNAMO_ENDPOINT

# データ挿入
aws dynamodb put-item --table-name $TABLE_NAME --item '{"iid": {"S": "TEST18939_TEST18939"},"fid":{"S": "TEST18939"},"tid": {"S": "TEST18939"},"score1_avg": {"N": "-0.000106996869565217"},"created_at": {"S": "2021-07-22 16:30:00"}}' --endpoint-url $DYNAMO_ENDPOINT

aws dynamodb put-item --table-name $TABLE_NAME --item '{"iid": {"S": "TEST18940_TEST18940"},"fid":{"S": "TEST18940"},"tid": {"S": "TEST18940"},"score1_avg": {"N": "-0.0024668778173913"},"created_at": {"S": "2021-07-22 16:30:00"}}' --endpoint-url $DYNAMO_ENDPOINT

aws dynamodb put-item --table-name $TABLE_NAME --item '{"iid": {"S": "TEST18941_TEST18941"},"fid":{"S": "TEST18941"},"tid": {"S": "TEST18941"},"score1_avg": {"N": "-0.00175137310521739"},"created_at": {"S": "2021-07-22 16:30:00"}}' --endpoint-url $DYNAMO_ENDPOINT

aws dynamodb put-item --table-name $TABLE_NAME --item '{"iid": {"S": "TEST18942_TEST18942"},"fid":{"S": "TEST18942"},"tid": {"S": "TEST18942"},"score1_avg": {"N": "-0.00225430608695652"},"created_at": {"S": "2021-07-22 16:30:00"}}' --endpoint-url $DYNAMO_ENDPOINT

aws dynamodb put-item --table-name $TABLE_NAME --item '{"iid": {"S": "TEST18943_TEST18943"},"fid":{"S": "TEST18943"},"tid": {"S": "TEST18943"},"score1_avg": {"N": "-0.000577298190521739"},"created_at": {"S": "2021-07-22 16:30:00"}}' --endpoint-url $DYNAMO_ENDPOINT
