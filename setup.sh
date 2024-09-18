#!/bin/sh
docker compose pull
docker compose build
# --rm tells Docker to remove the container once it completes
docker compose run --rm inferno bundle exec inferno migrate
