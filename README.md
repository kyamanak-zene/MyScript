# 使い方
## get-session-token.sh
source で実行することで環境変数が .sh の外でも使えるようになる
```
$ source get-session-token.sh <IAM> <MFA TOKEN>
[INFO] IAM: 1111111111
[INFO] USERNAME: kyamanak
[INFO] TOKEN_CODE: 7777777

# 環境変数が設定されている
echo $AWS_ACCESS_KEY_ID
ABCDEFGH
```
