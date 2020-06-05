#!/bin/bash -e

STAGE=$1

echo "Deploying for stage $STAGE"

if [[ "$STAGE" == "prod" ]]; then
  ACCOUNT=947618278001
else
  ACCOUNT=477873552632
fi

eval "$(aws ecr get-login --no-include-email)"
docker build -t guild/smtp-relay-automation-$STAGE .
docker tag guild/smtp-relay-automation-$STAGE:latest $ACCOUNT.dkr.ecr.us-west-2.amazonaws.com/guild/smtp-relay-automation-$STAGE:latest
docker push $ACCOUNT.dkr.ecr.us-west-2.amazonaws.com/guild/smtp-relay-automation-$STAGE:latest