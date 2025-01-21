#!/bin/bash

# Stop all containers in the ragflow project
docker compose -p ragflow -f docker-compose.yml down

echo "RAGFlow services have been stopped."