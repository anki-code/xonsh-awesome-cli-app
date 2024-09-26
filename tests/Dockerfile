FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y git openssh-client python3 python3-pip openssl wget sudo vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m usr && echo "usr ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER usr
WORKDIR /home/usr
CMD ["/bin/bash"]
