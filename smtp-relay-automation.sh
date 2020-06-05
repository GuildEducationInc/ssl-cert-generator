#!/usr/bin/env sh

ACCOUNT="$(aws sts get-caller-identity | jq -r '.Account')"

if [[ $ACCOUNT -eq 947618278001 ]]
then
  DOMAIN="guild-cloud.com"
  ENVIRONMENT="prod"
  /root/.acme.sh/acme.sh --issue --dns dns_aws -d smtp-relay.guild-cloud.com -d smtp-relay.guild-cloud.com
elif [[ $ACCOUNT -eq 477873552632 ]]
then
  DOMAIN="dev-guild-cloud.com"
  ENVIRONMENT="dev"
   /root/.acme.sh/acme.sh --issue --dns dns_aws -d smtp-relay.dev-guild-cloud.com -d smtp-relay.dev-guild-cloud.com
else
  echo "unable to identify AWS account"
  exit 1
fi

aws ssm put-parameter \
  --region us-west-2 \
  --name "smtp-relay-cert-${ENVIRONMENT}" \
  --type "String" \
  --value "$(cat acme.sh/smtp-relay.${DOMAIN}/fullchain.cer)" \
  --overwrite

aws ssm put-parameter \
  --region us-west-2 \
  --name "smtp-relay-key-${ENVIRONMENT}" \
  --type "String" \
  --value "$(cat acme.sh/smtp-relay.${DOMAIN}/smtp-relay.${DOMAIN}.key)" \
  --overwrite