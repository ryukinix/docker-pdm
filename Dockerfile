FROM python:3.9

ENV HOME=/tmp

# for scipy
RUN apt update && apt install gfortran libatlas-base-dev -y
# for opencv
RUN apt-get update && apt-get install libgl1 -y
RUN pip install pdm setuptools wheel
RUN pdm init -n && pdm add opencv-python scipy==1.9.1 jupyterlab matplotlib  # cache

WORKDIR /app

ENTRYPOINT ["pdm", "run"]
