
FROM hashicorp/terraform:1.2.1 as tf

FROM amazon/aws-cli:2.7.4

COPY --from=tf /bin/terraform /bin/terraform
ENTRYPOINT ["/bin/bash"]
