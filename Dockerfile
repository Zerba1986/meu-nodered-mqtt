FROM node:18-alpine

# 1. Instala dependências
RUN apk add --no-cache mosquitto supervisor bash util-linux

# 2. Configura Node-RED
RUN npm install -g --unsafe-perm node-red@3.1.0
WORKDIR /data
COPY package.json /data/
RUN npm install --production

# 3. Copia configurações do GitHub
COPY settings.js /data/settings.js
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY mosquitto_passwd /etc/mosquitto/passwd
COPY supervisord.conf /etc/supervisord.conf

# 4. CRUCIAL: Criptografa a senha e ajusta permissões
# O comando -U transforma "user:pass" em hash seguro
RUN mosquitto_passwd -U /etc/mosquitto/passwd && \
    chown mosquitto:mosquitto /etc/mosquitto/passwd && \
    chmod 600 /etc/mosquitto/passwd && \
    mkdir -p /var/log/mosquitto /var/lib/mosquitto /run/mosquitto && \
    chown -R mosquitto:mosquitto /var/log/mosquitto /var/lib/mosquitto /run/mosquitto

RUN chown -R node:node /data
EXPOSE 1880 1883 9001
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
