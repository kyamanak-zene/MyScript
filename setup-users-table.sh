#!/bin/bash

export TABLE_NAME=users
export DYNAMO_ENDPOINT=http://localhost:8000

# テーブル作成
aws dynamodb create-table --table-name $TABLE_NAME \
  --attribute-definitions '[{"AttributeName": "kintone_record_no","AttributeType": "N"}]' \
  --key-schema '[{"AttributeName": "kintone_record_no","KeyType": "HASH"}]' \
  --provisioned-throughput '{"ReadCapacityUnits": 5,"WriteCapacityUnits": 5}' \
  --endpoint-url $DYNAMO_ENDPOINT

# データ挿入
aws dynamodb put-item --table-name $TABLE_NAME \
  --item '{"kintone_record_no": {"N": "1"},"name":{"S": "山田 太郎"},"zip_code": {"S": "163-8001"},"address": {"S": "東京都新宿区 西新宿二丁目８番１号"},"birthday": {"S": "2001-10-04"},"sex": {"S": "male"},"pdf_created_flag": {"N": "0"},"activation_code": {"S": "TEST18939"},"tid": {"S": "TEST18939"},"created_at": {"S": "2021-07-22 16:30:00"}}' \
  --endpoint-url $DYNAMO_ENDPOINT
aws dynamodb put-item --table-name $TABLE_NAME \
  --item '{"kintone_record_no": {"N": "2"},"name":{"S": "山田 花子"},"zip_code": {"S": "2020-12-02"},"address": {"S": "東京都墨田区 押上１丁目１−２ 東京スカイツリー"},"birthday": {"S": "2020-12-02"},"sex": {"S": "female"},"pdf_created_flag": {"N": "1"},"activation_code": {"S": "TEST18940"},"tid": {"S": "TEST18940"},"created_at": {"S": "2021-07-22 16:30:00"}}' \
  --endpoint-url $DYNAMO_ENDPOINT
