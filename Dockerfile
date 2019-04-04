FROM alpine

RUN wget https://github.com/rancher/k3s/releases/download/v0.3.0/k3s && chmod +x k3s && cp k3s /usr/bin/k3s

EXPOSE 6443

LABEL cisco.info.name="K3s x86" \
      cisco.info.description="k3s implementation" \
      cisco.info.version="0.1" \
      cisco.info.author-link="" \
      cisco.info.author-name="" \
      cisco.type=docker \
      cisco.cpuarch=x86_64 \
      cisco.resources.profile=custom \
      cisco.resources.cpu=300 \
      cisco.resources.memory=300 \
      cisco.resources.disk=100 \
      cisco.resources.network.0.interface-name=eth0 \
      cisco.resources.network.0.ports.tcp=[6443]

CMD ["k3s", "server", "--disable-agent", "--no-deploy", "traefik", "--no-deploy", "flannel"]
