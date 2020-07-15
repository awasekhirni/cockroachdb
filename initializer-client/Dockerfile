FROM cockroachdb/cockroach:latest

LABEL maintainer="awasekhirni@gmail.com"

ADD init.sh /cockroach/
RUN chmod a+x /cockroach/init.sh

WORKDIR /cockroach/

ENTRYPOINT ["/cockroach/init.sh"]
