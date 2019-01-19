FROM ubuntu:18.04
MAINTAINER Raj &amp;lt;raj@fake.email&amp;gt;

RUN mkdir /config /app
COPY ./src/testsit /app
COPY ./config/requirements.pip /config/requirements.pip
RUN apt-get -yqq update && apt-get install -yqq python python-dev python-pip
RUN pip install -r /config/requirements.pip

WORKDIR /app
#CMD ["python", "app.py"]
