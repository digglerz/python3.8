FROM python:3.8.5-slim-buster
# We choose an Python image based on :
# - Debian 9, slim version
# - Python 3.8.5
# See here for all Python images : https://hub.docker.com/_/python

# Pipenv install
#
# Warnings : this container is explicitely configured for Dev environments
#  - pipfile --dev option
RUN apt update -y \
  && pip install --upgrade pip \
  && pip install pipenv

# Tools install
RUN apt install -y zip

# Set Timezone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone