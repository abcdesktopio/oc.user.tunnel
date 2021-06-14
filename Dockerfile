# defaul TAG is dev
ARG TAG=dev
# Default release is 18.04
ARG BASE_IMAGE_RELEASE=18.04
# Default base image 
ARG BASE_IMAGE=abcdesktopio/oc.user.18.04

# --- BEGIN node_modules_builder ---
FROM $BASE_IMAGE:$TAG 

USER root

RUN apt-get update &&  apt-get install -y --no-install-recommends  \
   	sshd		\
		netcat 	\
    && apt-get clean	\
    && rm -rf /var/lib/apt/lists/*
    
USER balloon
