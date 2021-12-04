FROM jupyter/tensorflow-notebook

USER root

WORKDIR /usr/bin

RUN apt-get update && \ 
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    wget https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip

WORKDIR /home/patents

COPY requirements.txt .

RUN pip install -r requirements.txt 

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root"]