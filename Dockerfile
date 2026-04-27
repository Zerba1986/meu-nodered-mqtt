FROM node:18-alpine

# 1. Instala Mosquitto, Supervisor e dependências do sistema
RUN apk add --no-cache \
    mosquitto \
    supervisor \
    bash \
    util-linux

# 2. Instala Node-RED globalmente
RUN npm install -g --unsafe-perm node-red@3.1.0

# 3. Prepara o diretório de dados do Node-RED
WORKDIR /data
COPY package.json /data/
RUN npm install --production

# 4. Copia os arquivos de configuração do seu GitHub para o container
# Certifique-se de que os nomes dos arquivos no seu GitHub são exatamente esses
COPY settings.js /data/settings.js
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY mosquitto_passwd /etc/mosquitto/passwd
RUN mosquitto_passwd -U /etc/mosquitto/passwd
COPY supervisord.conf /etc/supervisord.conf

# 5. CRUCIAL: Ajuste de permissões para o Mosquitto
# O Mosquitto exige que o arquivo de senha pertença a ele e tenha permissão restrita
RUN mkdir -p /var/log/mosquitto /var/lib/mosquitto /run/mosquitto && \
    chown -R mosquitto:mosquitto /var/log/mosquitto /var/lib/mosquitto /run/mosquitto /etc/mosquitto && \
    chown mosquitto:mosquitto /etc/mosquitto/passwd && \
    chmod 600 /etc/mosquitto/passwd

# 6. Garante que o diretório /data tenha as permissões corretas para o Node-RED
RUN chown -R node:node /data

# 7. Expõe as portas (1880: Node-RED, 1883: MQTT, 9001: WebSockets)
EXPOSE 1880 1883 9001

# 8. Comando de inicialização via Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
                    CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
