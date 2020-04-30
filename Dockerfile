FROM node:11.1.0-alpine as build
WORKDIR /app
COPY package*.json /app/
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY ./ /app/

EXPOSE 3000

CMD ["npm", "start"]