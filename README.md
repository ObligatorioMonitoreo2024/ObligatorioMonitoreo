# ObligatorioMonitoreo

- [Introducción](#Introducción)
- [Diagrama](#diagrama)
- [Requerimientos](#requerimientos)
- [Despliegue](#despliegue)
- [Configuraciones](#configuraciones)
- [Pruebas](#pruebas)
- [Mejoras](#mejoras)
- [Problemas](#problemas)
- [Bibliografia](#bibliografia)

## Introducción

## Diagrama

## Requerimientos

Actualizar sistema:

```bash
sudo dnf --refresh update
sudo dnf upgrade
```

## Despliegue 

## Configuraciones

<p align = "center"> 
<img src = "img/Servidores.png">
</p>

## Pruebas

## Mejoras

- Levantar los contenedores en un ambiente con alta disponibilidad por ejemplo un cluster de kubernetes
- Monitoreo de la infraestructura de docker o cluster de kubernetes

## Problemas

Nos encontramos con un problema en el contenedor del webserver que corre apache, debido a que el mismo no generaba registros en el archivo `/var/log/apache2/error.log` al consultar una página que no existía.
Para resolver esto realizamos los siguientes pasos:
-	Creamos un archivo `httpd.conf` en el directorio donde se encuentra el Dockerfile en el servidor de Docker.
-	A este archivo se le modifico el valor de LogLevel de warm a debug
-	En el archivo Dockerfile se copia el `httpd.conf` local hacia el contenedor en la siguiente ruta `/etc/apache2/httpd.conf`,generando una imagen con el archivo modificado.


## Bibliografia

-Material de aulas
-[Zabbix](https://www.zabbix.com/container_images)
-[Grafana-Loki](https://grafana.com/docs/loki/latest/setup/install/docker/)
-[DockerHUB-Mysql](https://hub.docker.com/_/mysql)

