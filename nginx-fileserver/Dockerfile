#nginxfileserver 
FROM nginx:alpine 
#maintainer information 
LABEL maintainer="awasekhirni@gmail.com"
#COPY configuration to the docker image 
COPY nginx.conf /etc/nginx/nginx.conf 
#execute create directory and previleges
RUN mkdir -p /mnt/db-backups/
RUN chmod -R 777 /mnt/db-backups

#expose the ports 
EXPOSE 20150

CMD ["nginx","-g","daemon off;"]