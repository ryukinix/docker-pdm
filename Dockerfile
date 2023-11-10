FROM python:3.11

ENV HOME=/tmp

# for scipy
RUN apt update && apt install gfortran libatlas-base-dev -y
# for opencv
RUN apt-get update && apt-get install libgl1 -y
RUN pip install pdm setuptools wheel
RUN pdm init -n
RUN sed -i 's/^requires-python.*/requires-python\ =\ ">=3.9,<3.12"/g' pyproject.toml
RUN pdm add scipy==1.11.3 jupyterlab matplotlib  # cache

WORKDIR /app

ENTRYPOINT ["pdm", "run"]
