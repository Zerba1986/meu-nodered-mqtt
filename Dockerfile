FROM nodered/node-red:latest

USER root
# Cria a pasta e garante que o usuário node-red seja o dono dela
RUN mkdir -p /data && chown -R node-red:node-red /data

# Garante permissões de escrita e leitura
RUN chmod -R 777 /data

USER node-red

COPY package.json .
COPY settings.js /data/settings.js

# Instala os nós (Dashboard, etc)
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
