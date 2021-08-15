# 使い方
## get-session-token.sh
source で実行することで環境変数が .sh の外にも設定される。
```
# 引数に IAM と MFA TOKEN を付与する
$ source get-session-token.sh <IAM> <MFA TOKEN>
[INFO] IAM: 1111111111
[INFO] USERNAME: kyamanak
[INFO] TOKEN_CODE: 7777777

# 環境変数が設定されている
echo $AWS_ACCESS_KEY_ID
ABCDEFGH
```
