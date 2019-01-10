FROM node:lts-alpine

ENV NODE_ENV production

COPY package*.json /app/mongodb-grafana/

WORKDIR /app/mongodb-grafana/

RUN npm install --production

# Bundle app source
COPY . .

WORKDIR /app/mongodb-grafana/server/

EXPOSE 3333
USER nobody

CMD ["node", "/app/mongodb-grafana/server/mongodb-proxy.js"]
