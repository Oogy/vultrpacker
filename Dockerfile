FROM centos:7

ARG GO_VERSION
ENV GO_VERSION ${GO_VERSION}

ARG GO_URL
ENV GO_URL ${GO_URL}

ARG PACKER_VERSION
ENV PACKER_VERSION ${PACKER_VERSION}

ARG PACKER_URL
ENV PACKER_URL ${PACKER_URL}

ARG PACKER_BUILDER_VULTR_VERSION
ENV PACKER_BUILDER_VULTR_VERSION ${PACKER_BUILDER_VULTR_VERSION}

ARG PACKER_BUILDER_VULTR_URL
ENV PACKER_BUILDER_VULTR_URL ${PACKER_BUILDER_VULTR_URL}

RUN cd /root && \
    yum -y update && \
    yum -y install unzip wget && \
    wget --quiet ${GO_URL} && \
    tar -C /usr/local -zxf go${GO_VERSION}.linux-amd64.tar.gz && \ 
    wget --quiet ${PACKER_URL} && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    wget --quiet ${PACKER_BUILDER_VULTR_URL} && \
    tar -C /usr/local/bin -zxf packer-builder-vultr_${PACKER_BUILDER_VULTR_VERSION}_linux_64-bit.tar.gz 
       
CMD ["/bin/bash"]
