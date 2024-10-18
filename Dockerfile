FROM httpd:latest

COPY ./web /usr/local/apache2/htdocs

RUN apt-get update \
    && apt-get install -y netcat

# Install the requirements
COPY requirements.txt $APP
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN apt-get update
RUN apt-get install wget -y



