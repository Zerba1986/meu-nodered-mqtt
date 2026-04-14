FROM nodered/node-red:4.0.2  # Ou 'latest' para pegar a 4.x atual
COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
