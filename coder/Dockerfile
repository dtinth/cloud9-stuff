FROM codercom/code-server:1.621
USER root
RUN adduser --gecos '' --disabled-password --uid 501 ec2-user
RUN echo "ec2-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd
USER ec2-user
WORKDIR /mnt/project