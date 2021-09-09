#!/bin/bash

export TABLE_NAME=users
export DYNAMO_ENDPOINT=http://localhost:8000

# テーブル作成
aws dynamodb create-table --table-name $TABLE_NAME \
  --attribute-definitions '[{"AttributeName": "kintone_record_no","AttributeType": "N"},{"AttributeName": "pdf_not_created_flag","AttributeType": "N"}]' \
  --key-schema '[{"AttributeName": "kintone_record_no","KeyType": "HASH"}]' \
  --provisioned-throughput '{"ReadCapacityUnits": 5,"WriteCapacityUnits": 5}' \
  --global-secondary-indexes '[{"IndexName": "pdf_not_created_flag-index","KeySchema":[{"AttributeName":"pdf_not_created_flag","KeyType":"HASH"}], "ProvisionedThroughput": {"ReadCapacityUnits": 1,"WriteCapacityUnits": 1},"Projection":{"ProjectionType":"ALL"}}]' \
  --endpoint-url $DYNAMO_ENDPOINT

# データ挿入
aws dynamodb put-item --table-name $TABLE_NAME \
  --item '{"kintone_record_no": {"N": "1"},"name":{"S": "山田 太郎"},"zip_code": {"S": "163-8001"},"address": {"S": "東京都新宿区 西新宿二丁目８番１号"},"birthday": {"S": "2001-10-04"},"sex": {"S": "male"},"pdf_not_created_flag": {"N": "0"},"activation_code": {"S": "TEST18939"},"tid": {"S": "TEST18939"},"created_at": {"S": "2021-07-22 16:30:00"}}' \
  --endpoint-url $DYNAMO_ENDPOINT
aws dynamodb put-item --table-name $TABLE_NAME \
  --item '{"kintone_record_no": {"N": "2"},"name":{"S": "山田 花子"},"zip_code": {"S": "131-8634"},"address": {"S": "東京都墨田区 押上１丁目１−２ 東京スカイツリー"},"birthday": {"S": "2020-12-02"},"sex": {"S": "female"},"pdf_not_created_flag": {"N": "1"},"activation_code": {"S": "TEST18940"},"tid": {"S": "TEST18940"},"created_at": {"S": "2021-07-22 16:30:00"}}' \
  --endpoint-url $DYNAMO_ENDPOINT
aws dynamodb put-item --table-name $TABLE_NAME \
  --item '{"kintone_record_no": {"N": "3"},"name":{"S": "鈴木 次郎"},"zip_code": {"S": "110-8711"},"address": {"S": "東京都台東区 上野公園９−８３"},"birthday": {"S": "1982-03-20"},"sex": {"S": "male"},"activation_code": {"S": "TEST18941"},"tid": {"S": "TEST18941"},"created_at": {"S": "2021-07-22 16:30:00"}}' \
  --endpoint-url $DYNAMO_ENDPOINT
