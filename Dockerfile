FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install sudo
RUN sudo apt-get -y install python3
RUN python3 -V

RUN pip3 install -r requirements.txt

RUN sudo apt-get install -y python3-pip
RUN sudo apt-get install -y build-essential libssl-dev libffi-dev python3-dev
RUN sudo apt-get install -y python3-venv
RUN mkdir /workdir/ && cd /workdir/

WORKDIR /workdir/
RUN python3 -m venv --system-site-packages big-data-env
RUN ./big-data-env/bin/activate 
RUN pip3 install jupyter 