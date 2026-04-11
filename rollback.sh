#!/bin/bash
if [ $(docker inspect -f '{{.State.Running}}' app) == "true" ]; then
    echo "Despliegue exitoso."
else
    echo "Error detectado. Reintentando..."
    docker stop app || true
    docker rm app || true
    docker run -d --name app -p 8080:80 nginx:latest
fi
