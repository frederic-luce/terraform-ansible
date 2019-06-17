FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -q -y install curl software-properties-common unzip
RUN curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip \
    && unzip /tmp/terraform.zip -d /usr/local/bin
RUN apt-add-repository --yes --update ppa:ansible/ansible \
    && apt-get -q -y install ansible
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
    && (echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list) \
    && (curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -) \
    && apt-get update \
    && apt-get -q -y install google-cloud-sdk

