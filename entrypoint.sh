#!/bin/bash -e
# borrowed from Erik Doernenburg:
# https://my.thoughtworks.com/groups/techops-community/blog/2015/11/17/aws-account-access-via-temporary-api-tokens#comment-38435
ROLE=becomeAdmin
ACCOUNT=644540006937
DURATION=3600

# KST=access*K*ey, *S*ecretkey, session*T*oken
KST=(`aws sts assume-role --role-arn "arn:aws:iam::$ACCOUNT:role/$ROLE" \
--role-session-name buildpack-iac \
--duration-seconds $DURATION \
--query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' \
--output text`)

export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-us-east-1}
export AWS_ACCESS_KEY_ID=${KST[0]}
export AWS_SECRET_ACCESS_KEY=${KST[1]}
export AWS_SESSION_TOKEN=${KST[2]}

exec $@