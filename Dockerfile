# Amazon linux
FROM amazonlinux:latest

RUN yum update -y

RUN yum install -y \
	gcc \
	openssl-devel \
	bzip2-devel \
	libffi-devel \
	python3 \
	glibc \
	groff \
	jq \
	make \
	zip \
	unzip \
	java-1.8.0-openjdk \
	java-1.8.0-openjdk-devel \
	tar


RUN ln -sf /usr/bin/python3 /usr/bin/python \
	&& ln -sf /usr/bin/pip3 /usr/bin/pip


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
	&& unzip awscliv2.zip \
	&& /aws/install

RUN pip3 install \
	pypandoc

RUN pip3 install \
	autopep8 \
	virtualenv \
	pylint \
	coverage \
	sphinx \
	sphinx-rtd-theme \
	boto3 \
	py4j \
	pyspark==2.4.7 \
	s3pypi \
	pandas==0.23.4 \
	snowflake-connector-python

RUN rm -rf \
	tmp \
	awscliv2

COPY ["switchRole.sh", "getParamStore.sh", "/var/"]
