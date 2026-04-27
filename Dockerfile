FROM node:18-alpine

# Instala Mosquitto e supervisor
RUN apk add --no-cache \
    mosquitto \
        supervisor \
            bash

            # Instala Node-RED globalmente
            RUN npm install -g --unsafe-perm node-red@3.1.0

            # Instala dependencias do Node-RED
            WORKDIR /data
            COPY package.json .
            RUN npm install

            # Copia configuracoes
            COPY settings.js .
            COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
            COPY mosquitto_passwd /etc/mosquitto/passwd
            COPY supervisord.conf /etc/supervisord.conf

            # Cria diretorios necessarios
            RUN mkdir -p /var/log/mosquitto /var/run/mosquitto /var/lib/mosquitto && \
                chown -R mosquitto:mosquitto /var/log/mosquitto /var/run/mosquitto /var/lib/mosquitto && \
                    chmod 600 /etc/mosquitto/passwd

                    EXPOSE 1880 1883 9001

                    CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
                    
