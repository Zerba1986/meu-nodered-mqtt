FROM node:18-alpine

# 1. Instala dependencias
RUN apk add --no-cache mosquitto supervisor bash util-linux

# 2. Configura Node-RED
RUN npm install -g --unsafe-perm node-red@3.1.0
WORKDIR /data
COPY package.json /data/
RUN npm install --production

# 3. Copia configuracoes do GitHub
COPY settings.js /data/settings.js
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY supervisord.conf /etc/supervisord.conf

# 4. Cria usuario e senha no Mosquitto com mosquitto_passwd -b
RUN mkdir -p /etc/mosquitto && \
    mosquitto_passwd -b -c /etc/mosquitto/passwd joazeirofelipe Mqtt@Railway2026 && \
        chown mosquitto:mosquitto /etc/mosquitto/passwd && \
            chmod 600 /etc/mosquitto/passwd

            # 5. Permissoes do Mosquitto
            RUN mkdir -p /var/log/mosquitto /var/lib/mosquitto /run/mosquitto && \
                chown -R mosquitto:mosquitto /var/log/mosquitto /var/lib/mosquitto /run/mosquitto /etc/mosquitto

                # 6. Permissoes do Node-RED
                RUN chown -R node:node /data

                EXPOSE 1880 1883 9001

                CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
                
