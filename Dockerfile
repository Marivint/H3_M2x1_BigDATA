FROM ubuntu:18.04

# APT
RUN apt update
RUN apt -y install sudo

# PYTHON
RUN sudo apt install -y python3
RUN sudo apt install -y python3-pip
RUN sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
RUN sudo apt install -y python3-venv

# MKDIR
RUN mkdir /workdir/ && cd /workdir/
WORKDIR /workdir/

# VENV
RUN python3 -m venv --system-site-packages big-data-env

# REQUIREMENTS
RUN . big-data-env/bin/activate
COPY requirements.txt .
RUN pip3 install -r 'requirements.txt'

# JUPYTER NOTEBOOK
RUN pip3 install jupyter 
CMD ["sh", "-c" , "jupyter notebook --no-browser --port=8000 --ip='0.0.0.0' --allow-root"]
EXPOSE 8000
