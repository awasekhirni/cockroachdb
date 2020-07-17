#haproxy docker file 
FROM haproxy:alpine 
#maintainer information 
LABEL maintainer="awasekhirni@gmail.com"
#COPY configuration 
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg 

#Expose ports 
EXPOSE 5432
EXPOSE 8080
EXPOSE 8081 

