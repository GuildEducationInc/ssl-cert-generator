#!/usr/bin/env sh

# ACCOUNT="$(aws sts get-caller-identity | jq -r '.Account')"

# if [[ $ACCOUNT -eq 947618278001 ]]
# then
  DOMAIN="guild-cloud.com"
  ENVIRONMENT="prod"
  /root/.acme.sh/acme.sh --issue --dns dns_aws -d smtp-relay.guild-cloud.com -d smtp-relay.guild-cloud.com


# aws ssm put-parameter \
#   --region us-west-2 \
#   --name "smtp-relay-cert-${ENVIRONMENT}" \
#   --type "String" \
#   --value "$(cat acme.sh/smtp-relay.${DOMAIN}/fullchain.cer)" \
#   --overwrite

# aws ssm put-parameter \
#   --region us-west-2 \
#   --name "smtp-relay-key-${ENVIRONMENT}" \
#   --type "String" \
#   --value "$(cat acme.sh/smtp-relay.${DOMAIN}/smtp-relay.${DOMAIN}.key)" \
