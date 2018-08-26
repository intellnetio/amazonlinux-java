FROM amazonlinux

# Install OS packages
RUN yum -y upgrade \
    && yum -y update \
    && yum -y install java-1.8.0-openjdk-devel \
    && yum -y install wget nano which git

RUN wget https://bootstrap.pypa.io/get-pip.py && python2 get-pip.py

# Upgrade pip
RUN pip2 install --upgrade pip

# Install AWS CLI, NLTK, NLTK_DATA, numpy, tinysegmenter
RUN pip2 install -qqq awscli

RUN wget -q http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
RUN yum install -y apache-maven

CMD ["/bin/bash"]
