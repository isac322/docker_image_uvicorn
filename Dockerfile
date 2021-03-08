ARG PYTHON_VER=3.9
ARG PYTHON_IMG_TYPE=alpine

FROM python:${PYTHON_VER} AS builder

ARG EXT_TYPE=essential
COPY requirements-${EXT_TYPE}.in /tmp/requirements.txt
RUN pip wheel --no-binary :all: -r /tmp/requirements.txt --wheel-dir /tmp/wheels

FROM python:${PYTHON_VER}-${PYTHON_IMG_TYPE}
COPY --from=builder /tmp/wheels/* /tmp/wheels/
RUN pip install /tmp/wheels/*.whl

WORKDIR /app
ENTRYPOINT /usr/local/bin/uvicorn