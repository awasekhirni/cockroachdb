#creating loadbalancer using nginx:alpine 
#use the alpine image 
FROM nginx:alpine 
#maintainer information 
LABEL maintainer ="awasekhirni@gmail.com"
#COPYING THE CONFIGURATION PARAMETERS 
COPY nginx.conf /etc/nginx/nginx.conf 
#exposing the ports 
EXPOSE 5432
EXPOSE 8080 
#running the nginx with daemon off mode
CMD ["nginx","-g","daemon off;"]