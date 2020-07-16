#nginx based loadbalancer docker file using alpine linux build 
FROM nginx:alpine 
LABEL maintainer="awasekhirni@gmail.com"

COPY nginx.conf /etc/nginx/nginx.conf 

EXPOSE 5432
EXPOSE 8080 

CMD ["nginx","-g","daemon off;"]
