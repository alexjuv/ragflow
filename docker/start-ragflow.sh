#!/bin/bash

# Set environment variables if not already set
export DATA_PATH=${DATA_PATH:-/mnt/c/ai/data/genai/ragflow}

echo "Creating directories in ${DATA_PATH}..."
# Create necessary directories if they don't exist
for dir in ragflow-logs esdata infinity_data mysql_data minio_data redis_data; do
    mkdir -p "${DATA_PATH}/${dir}"
    echo "✓ Created ${DATA_PATH}/${dir}"
done

echo "Starting RAGFlow services..."
# Start the containers with project name "ragflow"
docker compose -p ragflow -f docker-compose.yml up -d

echo "Waiting for services to initialize..."
sleep 5

# Show running containers
echo "Checking running containers..."
docker compose -p ragflow ps

echo "RAGFlow services are starting up. You can check logs with:"
echo "docker compose -p ragflow logs -f"
