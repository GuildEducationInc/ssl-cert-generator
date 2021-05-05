# SSL-Cert-Generator

This is a fork of [Acme's SSL cert geneator](https://github.com/acmesh-official/acme.sh).

Follow these steps to generate a self-signed cert:

1) generate an ephemeral `AWS_ACCESS_KEY`, `AWS_SECRET_ACCESS_KEY`, and `AWS_SESSION_TOKEN` in the Okta console
2) build the Dockerfile `docker build -t guild/ssl .`
3) run this command to generate a cert for the SMTP relay
```
docker run --rm -it --env AWS_ACCESS_KEY=REPLACE --env AWS_SECRET_ACCESS_KEY=REPLACE --env AWS_SESSION_TOKEN=REPLACE -v "$(pwd)/out":/acme.sh --net=host guild/ssl --issue --dns dns_aws -d smtp-relay.guild-cloud.com -d smtp-relay.guild-cloud.com
```