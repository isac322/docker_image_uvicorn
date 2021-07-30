ARG PYTHON_VER=3.9
ARG PYTHON_IMG_TYPE=alpine

FROM python:${PYTHON_VER}-${PYTHON_IMG_TYPE} AS builder

ARG PYTHON_VER=3.9
ARG PYTHON_IMG_TYPE=alpine
ARG EXT_TYPE=essential
COPY requirements-${EXT_TYPE}.in /tmp/requirements.txt
RUN if test "${PYTHON_IMG_TYPE}" = 'alpine' && test "${EXT_TYPE}" != 'essential'; then \
    apk add --update gcc musl-dev make; \
    elif test "${PYTHON_IMG_TYPE}" = 'slim' && test "${EXT_TYPE}" != 'essential'; then \
    apt-get update -qq; apt-get install --no-install-recommends libc6-dev gcc make -y; fi && \
    pip wheel -r /tmp/requirements.txt --wheel-dir /tmp/wheels

FROM python:${PYTHON_VER}-${PYTHON_IMG_TYPE}
COPY --from=builder /tmp/wheels/* /tmp/wheels/
RUN pip install /tmp/wheels/*.whl && rm -rf /tmp

MAINTAINER 'Byeonghoon Isac Yoo <bh322yoo@gmail.com>'
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/uvicorn"]