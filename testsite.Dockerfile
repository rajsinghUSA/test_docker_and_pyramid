FROM ubuntu:18.04
MAINTAINER Raj &amp;lt;raj@fake.email&amp;gt;

ENV VENV=/app
ENV PYTHONUNBUFFERED 1

RUN mkdir /config /app
COPY /services_config/requirements.pip /config/requirements.pip
#COPY /volumes/src/testsite_config/development.ini /app/development.ini
COPY /volumes/src /app
#COPY /volumes/src/testsite_config/setup.py /app/setup.py

RUN apt-get -yqq update && apt-get install -yqq python python-dev python-pip python-virtualenv
RUN mkdir /app/venv
RUN echo "hello"
RUN virtualenv /app/venv
#RUN source /app/venv/bin/activate
RUN /app/venv/bin/pip install -r /config/requirements.pip
RUN /app/venv/bin/pip install -e /app/testsite_config
RUN /app/venv/bin/pserve /app/testsite_config/development.ini --reload
RUN source /app/venv/bin/activate
WORKDIR /app
RUN which python
RUN ls -a

#CMD ["python", "app.py"]
