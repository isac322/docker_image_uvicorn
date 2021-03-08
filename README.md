# Docker image preinstalled the Python package `uvicorn`

![Docker Pulls](https://img.shields.io/docker/pulls/isac322/uvicorn?logo=docker&style=flat-square)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/isac322/uvicorn/latest?logo=docker&style=flat-square)
![PyPI](https://img.shields.io/pypi/v/uvicorn?label=uvicorn&logo=python&style=flat-square)
![PyPI - Python Version](https://img.shields.io/pypi/pyversions/uvicorn?logo=python&style=flat-square)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/isac322/docker_image_uvicorn/master?logo=github&style=flat-square)
![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/isac322/docker_image_uvicorn/ci/master?logo=github&style=flat-square)
![Dependabpt Status](https://flat.badgen.net/github/dependabot/isac322/docker_image_uvicorn?logo=github)

Supported platform: `linux/amd64`, `linux/arm64/v8`, `linux/386`, `linux/arm/v7`

## Tag format

`<Python Version>-<Python Image type>-<uvicorn version>-<Extra option for uvicorn package>`

- `Python Version`: One of `py3.9`, `py3.8`, `py3.7`, `py3.6`
- `Python Image type`: One of `alpine`, `slim`
- `uvicorn version`: Version of `uvicorn`
- `Extra option for uvicorn package`
  - `essential`: Equivalent `pip install uvicorn`
  - `performance`: Equivalent `pip install uvicorn "uvloop==0.15.2; python_version > '3.6'"  httptools`
  - `standard`: Equivalent `pip install uvicorn[standard]`


## Aliased Tags

### Rule

- Latest version of Python or `uvicorn` can be omitted
- `essential` and `alpine` can be omitted

---

- `latest` == `alpine` == `essential` == `<latest uvicorn version>` == `<latest python version>-alpine-<latest uvicorn version>-essential`
- `standard` == `<latest python version>-alpine` == `<latest python version>-alpine-<latest uvicorn version>-standard`
- `py3.8` == `py3.8-alpine` == `py3.8-essential` == `py3.8-alpine-essential` == `py3.8-alpine-<latest uvicorn version>-essential`
- ...

## Command

Entrypoint of image is `uvicorn`.

So `docker run -ti isac322/uvicorn main:app` will execute `uvicorn main:app` internally.

## Working directory

`/app`
