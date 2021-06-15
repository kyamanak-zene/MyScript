# 使い方
## get-session-token.sh
参考：https://oji-cloud.net/2020/03/19/post-4581/　　

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
