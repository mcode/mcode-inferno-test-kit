#!/bin/sh
if docker compose stop inferno worker; then
    if docker compose build inferno worker; then
        docker compose start inferno worker
    else
        echo "Could not rebuild web services." >&2
    fi
else
    echo "Could not stop web services. This command is designed to reload just the Inferno services when running within a Docker Compose environment." >&2
fi
