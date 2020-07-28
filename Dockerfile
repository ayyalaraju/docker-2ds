FROM ubuntu:18.04

# Update and Install Required packages
RUN apt-get update && apt-get upgrade -y --no-install-recommends && apt-get install -y --no-install-recommends ca-certificates \
apt-transport-https \
curl \
apt-utils \
supervisor \
perl \
gnupg

# Install kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

# Add user
RUN groupadd --gid 1100 demo
RUN useradd --system --uid 1100 --gid 1100 -d /home/demo -s /bin/bash -G sudo demo
# Add user dir
RUN mkdir -p /home/demo/.kube
VOLUME [ "/home/demo/.kube"]
ENV PATH=${PATH}:/home/demo/.kube
ENV KUBECONFIG=/home/demo/.kube/config

CMD tail -f /dev/null
