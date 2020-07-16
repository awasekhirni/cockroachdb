#phase 1- generating the certificate for cockroachdb 
FROM cockroachdb/cockroach:latest as generator
LABEL maintainer="awasekhirni@gmail.com"

RUN mkdir -pv /tmp/certs/ca /tmp/certs/wahed /tmp/certs/itnan /tmp/certs/talata /tmp/safe /tmp/certs/client
#creating certificates
RUN ./cockroach cert create-ca --certs-dir=/tmp/certs/ca --ca-key=/tmp/safe/ca.key \
    && cp -v /tmp/certs/ca/ca.crt /tmp/certs/client \
    && cp -v /tmp/certs/ca/ca.crt /tmp/certs/wahed \
    && cp -v /tmp/certs/ca/ca.crt /tmp/certs/itnan \
    && cp -v /tmp/certs/ca/ca.crt /tmp/certs/talata 

#generating the certificates
RUN ./cockroach cert create-client root --certs-dir=/tmp/certs/client --ca-key=/tmp/safe/ca.key --also-generate-pkcs8-key
#copyign the certificates
RUN cp -v /tmp/certs/client/client.* /tmp/certs/wahed \
    && cp -v /tmp/certs/client/client.* /tmp/certs/itnan \
    && cp -v /tmp/certs/client/client.* /tmp/certs/talata
#running
RUN ./cockroach cert create-node wahed localhost lb --certs-dir=/tmp/certs/wahed --ca-key=/tmp/safe/ca.key
RUN ./cockroach cert create-node itnan localhost lb --certs-dir=/tmp/certs/itnan --ca-key=/tmp/safe/ca.key
RUN ./cockroach cert create-node talata localhost lb --certs-dir=/tmp/certs/talata --ca-key=/tmp/safe/ca.key

# Phase 2 - share certs

FROM alpine:latest

LABEL maintainer="awasekhirni@gmail.com"

RUN mkdir -pv /certs/wahed /certs/itnan /certs/talata /certs/client

COPY --from=generator  /tmp/certs/wahed/* /certs/wahed/
COPY --from=generator  /tmp/certs/itnan/* /certs/itnan/
COPY --from=generator  /tmp/certs/talata/* /certs/talata/
COPY --from=generator  /tmp/certs/client/* /certs/client/

CMD tail -f /dev/null

