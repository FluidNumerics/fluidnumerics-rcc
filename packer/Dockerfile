FROM gcr.io/google.com/cloudsdktool/cloud-sdk:slim as build

RUN apt-get update -y &&\
    apt-get install -y wget zip

RUN wget https://releases.hashicorp.com/packer/1.8.5/packer_1.8.5_linux_amd64.zip &&\ 
    unzip packer_1.8.5_linux_amd64.zip


FROM gcr.io/google.com/cloudsdktool/cloud-sdk:slim

RUN apt-get -y update && apt-get -y install ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=build packer /usr/bin/packer

RUN apt-get update -y &&\
    apt-get install -y python3 python3-pip &&\
    python3 -m pip install ansible

ENTRYPOINT ["/usr/bin/packer"]
