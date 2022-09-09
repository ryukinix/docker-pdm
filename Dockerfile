FROM python:3.10

ENV HOME=/tmp

# for scipy
RUN apt update && apt install gfortran libatlas-base-dev -y
# for opencv
RUN apt-get update && apt-get install libgl1 -y
RUN pip install pdm setuptools wheel
RUN pdm init -n && pdm add opencv-python scipy jupyterlab  # cache

WORKDIR /app

ENTRYPOINT ["pdm", "run"]
