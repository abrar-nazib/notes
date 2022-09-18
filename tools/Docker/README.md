# Used Docker commands

* ```sudo docker build -t hello-docker .```
  creates a docker image according to the Dockerfile of current directory

* ```docker images``` or ```docker image ls``` lists all existing docker images
* ```docker run imageName``` runs the docker image
* ```docker run -it imagename``` runs the docker image with root privilages
* ```docker pull username/imagename``` pulls a docker image from specified name