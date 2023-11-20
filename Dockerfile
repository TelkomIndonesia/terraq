FROM hashicorp/terraform:1.6.4

RUN apk add --no-cache jq

WORKDIR /src
COPY . .
ENTRYPOINT ["/src/query.sh"]