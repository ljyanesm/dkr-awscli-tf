
FROM hashicorp/terraform:1.2.1 as tf

FROM amazon/aws-cli:2.7.4

COPY --from=tf /bin/terraform /bin/terraform
RUN yum install -y git ssh wget curl
RUN curl -LO https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl && chmod +x kubectl && cp kubectl /usr/bin
ENTRYPOINT ["/bin/bash"]
