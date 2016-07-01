FROM phusion/baseimage:0.9.18

MAINTAINER Luke Campbell <luke.campbell@rpsgroup.com>

RUN apt-get update && apt-get install -y \
      git \
      libssl-dev \
      libxml2-dev \
      libxslt1-dev \
      python-dev \
      python-pip
#RUN rm -rf /var/lib/apt/lists/*
RUN pip install -U pip
RUN pip install -e git+https://github.com/ioos/catalog-harvesting.git@master#egg=catalog-harvesting
RUN useradd -m harvest
COPY ./contrib/my_init.d /etc/my_init.d
VOLUME ["/data"]

CMD ["/sbin/my_init", "--", "/bin/bash"]
