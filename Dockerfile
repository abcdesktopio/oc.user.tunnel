# defaul TAG is dev
ARG TAG=dev
# Default release is 18.04
ARG BASE_IMAGE_RELEASE=18.04
# Default base image 
ARG BASE_IMAGE=abcdesktopio/oc.user.18.04

# --- BEGIN node_modules_builder ---
FROM $BASE_IMAGE:$TAG 

USER root
COPY etc/supervisor/conf.d/sshd.conf /etc/supervisor/conf.d/sshd.conf
RUN apt-get update &&  apt-get install -y --no-install-recommends  \
   	ssh		\
	netcat 		\
	certbot		\
    && apt-get clean	\
    && rm -rf /var/lib/apt/lists/*

# permit boollon to change ssh config
RUN chown $BUSER:$BUSER /etc/ssh/*

# permit ballon to change certbot directory
RUN mkdir -p /etc/letsencrypt /var/lib/letsencrypt /var/log/letsencrypt && \
    chown balloon:root -R /var/lib/letsencrypt /var/log/letsencrypt /etc/letsencrypt 

USER $BUSER
