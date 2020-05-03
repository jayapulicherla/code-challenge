FROM node:11.1.0-alpine as build
WORKDIR /app
COPY package*.json /app/
COPY cypress.json /app/
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY ./ /app/
COPY cypress/ /app/

FROM cypress/base:10
RUN npm install --save-dev cypress
RUN $(npm bin)/cypress verify
RUN $(npm bin)/cypress run

EXPOSE 3000

CMD ["npm", "start"]