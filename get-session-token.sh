#!/bin/bash

iam=$1
token_code=$2
user_name=`whoami`

echo "[INFO] IAM: $iam"
echo "[INFO] USERNAME: $user_name"
echo "[INFO] TOKEN_CODE: $token_code"

resp=`aws sts get-session-token --serial-number arn:aws:iam::$iam:mfa/$user_name --token-code $token_code`

ACCESS_KEY_ID=`echo $resp | jq .Credentials.AccessKeyId | tr -d '"'`
SECRET_ACCESS_KEY=`echo $resp | jq .Credentials.SecretAccessKey | tr -d '"'`
SESSION_TOKEN=`echo $resp | jq .Credentials.SessionToken | tr -d '"'`

export AWS_ACCESS_KEY_ID="$ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$SECRET_ACCESS_KEY"
export AWS_SESSION_TOKEN="$SESSION_TOKEN"
