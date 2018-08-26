FROM ubuntu:latest

# Install gdc-client to download MCF-7.bam
ARG GDC_CLIENT_ZIP=https://gdc.cancer.gov/system/files/authenticated%20user/0/gdc-client_v1.3.0_Ubuntu14.04_x64.zip
RUN apt-get update -qq
RUN apt-get install -y wget zip unzip
RUN wget -q ${GDC_CLIENT_ZIP}
RUN unzip `basename ${GDC_CLIENT_ZIP}` \
  && rm `basename ${GDC_CLIENT_ZIP}` \
  && mv ./gdc-client /usr/local/bin

# Install Picard to convert bam to fastq
ARG BIOBAM_GZ=https://github.com/gt1/biobambam/releases/download/0.0.191-release-20150401083643/biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu.tar.gz
RUN apt-get install -y tar
RUN wget -q ${BIOBAM_GZ}
RUN tar xzvf `basename ${BIOBAM_GZ}` \
  && rm `basename ${BIOBAM_GZ}` \
  && mv ./biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu/bin/* /usr/local/bin \
  && mv ./biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu/lib/* /usr/local/lib
