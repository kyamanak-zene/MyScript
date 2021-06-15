#!/bin/bash

# 既に設定されている場合、設定し直す
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

iam=$1
token_code=$2
user_name=`whoami`

echo "[INFO] IAM: $iam"
echo "[INFO] USERNAME: $user_name"
echo "[INFO] TOKEN_CODE: $token_code"

resp=`aws sts get-session-token --serial-number arn:aws:iam::$iam:mfa/$user_name --token-code $token_code`

access_key_id=`echo $resp | jq .Credentials.AccessKeyId | tr -d '"'`
secret_access_key=`echo $resp | jq .Credentials.SecretAccessKey | tr -d '"'`
session_token=`echo $resp | jq .Credentials.SessionToken | tr -d '"'`

# 環境変数名は AWS から指定がある
export AWS_ACCESS_KEY_ID="$access_key_id"
export AWS_SECRET_ACCESS_KEY="$secret_access_key"
export AWS_SESSION_TOKEN="$session_token"
