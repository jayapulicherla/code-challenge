FROM ubuntu:14.04
# Install Node.js
RUN apt-get update
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential
RUN apt-get install  --yes xvfb
RUN apt-get install --yes libgtk2.0-0 libxtst6 libnss3 lib* libgtk-3-0 
RUN apt-get install --yes libgtk-3-dev libxss1 libasound2

WORKDIR /app
COPY package*.json /app/
COPY cypress.json /app/
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
RUN npm ci
COPY ./ /app/
COPY cypress/ /app/

#FROM cypress/base:10
#RUN npm install --save-dev cypress
#RUN npm ci
#RUN $(npm bin)/cypress verify

EXPOSE 3000

CMD ["npm", "start"]
