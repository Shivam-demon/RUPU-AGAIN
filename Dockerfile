FROM nikolaik/python-nodejs:python3.9-nodejs17
RUN apt-get update && apt-get upgrade -y
RUN apt-get install git curl python3-pip ffmpeg -y
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN if [ $OKTETO_TOKEN ]; then curl https://get.okteto.com -sSfL | sh; fi
COPY . /kaal/
WORKDIR /kaal/
RUN pip3 install -U -r requirements.txt
CMD python3 main.py

