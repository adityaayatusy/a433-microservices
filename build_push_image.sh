#!/bin/bash

#membuat image docker dari Dockerfile dengan nama karsajobs, dan memiliki tag lates
docker build -t order-service:latest .
#melihat daftar image di lokal
docker image ls
#mengubah nama image agar sesuai dengan format GitHub Packages
docker tag order-service:latest docker.pkg.github.com/adityaayatusy/a433-microservices/order-service:latest
#login ke GitHub Packages
docker login docker.pkg.github.com -u adityaayatusy --password-stdin < ~/github_token
#mengunggah image ke GitHub Packages
docker push docker.pkg.github.com/adityaayatusy/a433-microservices/order-service:latest
