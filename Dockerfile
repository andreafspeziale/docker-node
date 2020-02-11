FROM node:12.14.1

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

RUN mkdir /opt/node_app && chown node:node /opt/node_app
WORKDIR /opt/node_app

USER node
COPY package.json package-lock.json ./
RUN npm install --no-optional && npm cache clean --force

COPY . .

CMD [ "npm", "start" ]