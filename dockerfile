# Usa la imagen base de Alpine
FROM alpine:latest

# Instala el paquete del agente de Zabbix
RUN apk update && \
    apk add --no-cache zabbix-agent2 apache2 && \
    rm -rf /var/cache/apk/*

# Define las variables de entorno para la configuración del agente de Zabbix
ENV ZBX_SERVER_HOST="" 

# Copia tu archivo HTML de prueba al directorio de documentos del servidor web
COPY index.html /var/www/localhost/htdocs/
COPY httpd.conf /etc/apache2/httpd.conf 
# Exponer el puerto 80 para que se pueda acceder al servidor web
EXPOSE 80

# Configura el agente de Zabbix con las variables de entorno
CMD ["sh", "-c", "sed -i \"s/^Server=.*$/Server=${ZBX_SERVER_HOST}/\" /etc/zabbix/zabbix_agent2.conf && \
    httpd -D FOREGROUND & zabbix_agent2 -f"]


