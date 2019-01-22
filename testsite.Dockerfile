FROM ubuntu:18.04
MAINTAINER Raj &amp;lt;raj@fake.email&amp;gt;

ENV VENV=/app
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
COPY /volumes/testsite /app/testsite
COPY /services_config/pyramid_app_config/setup.py /app/setup.py
COPY /services_config/pyramid_app_config/development.ini /app/testsite_config/development.ini
COPY /services_config/pyramid_app_config/requirements.pip /app/testsite_config/requirements.pip

RUN apt-get -yqq update && apt-get install -yqq python python-dev python-pip python-virtualenv
RUN mkdir /app/venv

RUN virtualenv /app/venv
RUN ls /app/venv
#RUN source /app/venv/bin/activate
RUN /app/venv/bin/pip install -r /app/testsite_config/requirements.pip
# RUN /app/venv/bin/pip install -e /app/testsite_config
RUN /app/venv/bin/pip install -e "./app[testing]"
# RUN /app/venv/bin/pserve /app/testsite_config/development.ini --reload
WORKDIR /app
# RUN source /app/venv/bin/activate
RUN which python
RUN ls -a

#RUN /app/venv/bin/pserve /app/testsite_config/development.ini --reload
#CMD ["python", "app.py"]
