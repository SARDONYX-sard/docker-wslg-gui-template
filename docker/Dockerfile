FROM python:3.8.9-slim-buster

# hadolint ignore=DL3008,DL3059,DL3015
RUN apt-get update \
  && apt-get install -y curl git make sudo vim tk-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3008
RUN adduser --disabled-password --gecos '' user \
  && echo 'user ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/user
USER user
WORKDIR /home/user/code

# hadolint ignore=DL3013,DL3008
RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir --upgrade setuptools

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
