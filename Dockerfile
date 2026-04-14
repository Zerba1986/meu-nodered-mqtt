FROM nodered/node-red:latest

COPY settings.js /data/settings.js
COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
