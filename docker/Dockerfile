FROM python:3.8.9-slim-buster
ARG DEBIAN_FRONTEND=noninteractive
# hadolint ignore=DL3008,DL3059,DL3015
RUN apt-get update \
  && apt-get install -y curl git make vim tk-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG HOME=/root
ARG WORK_DIR=${HOME}/code

ENV PATH=/${HOME}/.local/bin:$PATH
# hadolint ignore=DL3013,DL3008
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir --upgrade setuptools \
  && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py \
  | python -

WORKDIR ${WORK_DIR}
