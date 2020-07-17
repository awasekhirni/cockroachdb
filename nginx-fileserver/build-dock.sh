#!/bin/bash
docker build --tag nginx-fileserver:1.0 .
docker run --publish 8080:8080 --detach --name nginx-fileserver nginx-fileserver:1.0

docker commit -m "Added nginx fileserver" -a "nginx-fileserver" nginx-fileserver syedawase/nginx-fileserver:latest
docker push syedawase/nginx-fileserver