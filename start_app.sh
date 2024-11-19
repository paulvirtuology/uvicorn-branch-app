#!/bin/bash

# Determine branch-specific port
BRANCH_NAME=$1

if [ "$BRANCH_NAME" == "main" ]; then
    PORT=8001
elif [ "$BRANCH_NAME" == "dev" ]; then
    PORT=8002
else
    echo "Unknown branch: $BRANCH_NAME. Exiting..."
    exit 1
fi

# Kill any existing process on the port
fuser -k ${PORT}/tcp || true

# Start the app
echo "Starting Uvicorn app on port $PORT for branch $BRANCH_NAME..."
nohup uvicorn app:app --host 0.0.0.0 --port $PORT > uvicorn.log 2>&1 &
