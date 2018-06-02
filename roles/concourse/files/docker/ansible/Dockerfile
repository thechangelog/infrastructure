FROM williamyeh/ansible:ubuntu16.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y curl openssl ca-certificates && rm -fr /var/lib/apt/lists
