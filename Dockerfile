FROM portainer/portainer:alpine

RUN apk add --update curl iptables && \
    rm -rf /var/cache/apk/*

ENV LANIP=172.18.0.1
ADD iptables.sh	/
RUN chmod +x /iptables.sh
#ENTRYPOINT ["/portainer"]
ENTRYPOINT []
CMD /iptables.sh ; /portainer ; bash

#docker build -t land007/portainer_iptables .
#> docker buildx build --platform linux/amd64,linux/arm64/v8,linux/arm/v7 -t land007/portainer_iptables --push .
#docker run -it --rm --name portainer_iptables -e "LANIP=172.17.0.1" -v /var/run/docker.sock:/var/run/docker.sock -p 9001:9000 --privileged land007/portainer_iptables
