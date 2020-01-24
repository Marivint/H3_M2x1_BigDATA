FROM ubuntu:18.04

RUN apt update
RUN apt -y install sudo

RUN sudo apt -y install python3

RUN sudo apt install -y python3-pip
RUN sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
RUN sudo apt install -y python3-venv

RUN mkdir /workdir/ && cd /workdir/

WORKDIR /workdir/

RUN python3 -m venv --system-site-packages big-data-env

RUN . big-data-env/bin/activate && pip3 install jupyter && jupyter notebook --allow-root --ip=0.0.0.0 --port=8888
