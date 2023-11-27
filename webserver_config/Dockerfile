FROM ubuntu:jammy

USER root

# Install Ansible and JDK
RUN apt-get update -y && apt-get install -y ansible curl openjdk-17-jdk
RUN useradd -ms /bin/bash webserver

#Add Inventory
COPY ./ansible_config/ssh_keys_gen.yaml /home/webserver/ssh_keys_gen.yaml

# Install/Configure SSH
RUN apt-get update -y && apt-get install -y openssh-server openssh-client
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /run/sshd
RUN chmod 755 /run/sshd

# Keep the container running and wait for further commands
CMD ["/usr/sbin/sshd", "-D"]