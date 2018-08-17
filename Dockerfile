FROM python:3.6-slim
ENV PYTHONUNBUFFERED 1
RUN mkdir /code \
&& mkdir -p /var/log/uwsgi
WORKDIR /code
ADD requirements.txt /code/
RUN apt-get update \
&& apt-get install -y python-dev default-libmysqlclient-dev gcc \
&& pip install --upgrade pip setuptools \
&& pip install -r requirements.txt
ADD ./code /code/