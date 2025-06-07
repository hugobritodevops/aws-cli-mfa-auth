# VARIÁVEIS
MFA_ARN="arn:aws:iam::YOUR_AWS_ACCOUNT_ID:mfa/YOUR_MFA_DEVICE_NAME"
DURATION=43200 # 12h
PROFILE=longterm
TARGET_PROFILE=default

echo -n "Insert MFA Code: "
read TOKEN_CODE

# OBTÉM AS CREDENCIAIS TEMPORÁRIAS
CREDS=$(aws sts get-session-token \
  --serial-number "$MFA_ARN" \
  --token-code "$TOKEN_CODE" \
  --duration-seconds "$DURATION" \
  --profile "$PROFILE" \
  --output json)

# EXTRAI CAMPOS
AWS_ACCESS_KEY_ID=$(echo $CREDS | jq -r .Credentials.AccessKeyId)
AWS_SECRET_ACCESS_KEY=$(echo $CREDS | jq -r .Credentials.SecretAccessKey)
AWS_SESSION_TOKEN=$(echo $CREDS | jq -r .Credentials.SessionToken)

# ATUALIZA O PROFILE DEFAULT NO ~/.aws/credentials
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" --profile "$TARGET_PROFILE"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY" --profile "$TARGET_PROFILE"
aws configure set aws_session_token "$AWS_SESSION_TOKEN" --profile "$TARGET_PROFILE"

echo "[INFO] Credenciais temporárias aplicadas ao profile \"$TARGET_PROFILE\"."