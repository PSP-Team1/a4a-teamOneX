FROM node:latest

WORKDIR /app

COPY node_app/package*.json ./
RUN npm install
RUN npm install -g nodemon

COPY node_app ./

EXPOSE 3000

CMD ["nodemon", "index.js"]
