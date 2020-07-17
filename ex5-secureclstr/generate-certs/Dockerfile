# in the first phase lets create the certificates for 3 nodes
#pull the image from cockroachdb-hub.docker.com
FROM cockroachdb/cockroach:latest as generator
#maintainer information
LABEL maintainer="awasekhirni@gmail.com"
# create directories for the certificates
RUN mkdir -pv /certs/ca /certs/wahed /certs/itnan /certs/talata /safe /certs/client
# generate certificates as done in windows in the powershell for each node
RUN ./cockroach cert create-ca --certs-dir=/certs/ca --ca-key=/safe/ca.key \
    && cp -v /certs/ca/ca.crt /certs/client \
    && cp -v /certs/ca/ca.crt /certs/wahed \
    && cp -v /certs/ca/ca.crt /certs/itnan \
    && cp -v /certs/ca/ca.crt /certs/talata
#generate certificate for root
RUN ./cockroach cert create-client root --certs-dir=/certs/client --ca-key=/safe/ca.key --also-generate-pkcs8-key
#copy the certificates
RUN cp -v /certs/client/client.* /certs/wahed \
    && cp -v /certs/client/client.* /certs/itnan \
    && cp -v /certs/client/client.* /certs/talata
#run your instances to use the certificates
RUN ./cockroach cert create-node wahed localhost lb --certs-dir=/certs/wahed --ca-key=/safe/ca.key
RUN ./cockroach cert create-node itnan localhost lb --certs-dir=/certs/itnan --ca-key=/safe/ca.key
RUN ./cockroach cert create-node talata localhost lb --certs-dir=/certs/talata --ca-key=/safe/ca.key

# in this phase lets copy them from the generator above
#use the alpine linux image
FROM alpine:latest
#maintainer information
LABEL maintainer="awasekhirni@gmail.com"

RUN mkdir -pv /certs/wahed /certs/itnan /certs/talata /certs/client

COPY --from=generator  /certs/wahed/* /certs/wahed/
COPY --from=generator  /certs/itnan/* /certs/itnan/
COPY --from=generator  /certs/talata/* /certs/talata/
COPY --from=generator  /certs/client/* /certs/client/

CMD tail -f /dev/null