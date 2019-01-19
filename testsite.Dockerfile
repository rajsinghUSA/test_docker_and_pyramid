FROM ubuntu:18.04
MAINTAINER Raj &amp;lt;raj@fake.email&amp;gt;

ENV PYTHONUNBUFFERED 1

RUN mkdir /config /app
COPY /src /app
COPY /config/requirements.pip /config/requirements.pip
COPY /config/development.ini /app/development.ini
COPY /config/setup.py /app/setup.py

RUN apt-get -yqq update && apt-get install -yqq python python-dev python-pip
RUN pip install -r /config/requirements.pip

WORKDIR /app
RUN ls -a

#CMD ["python", "app.py"]
