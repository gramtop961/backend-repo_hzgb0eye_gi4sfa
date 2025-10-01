#!/bin/bash
echo "Starting FastAPI backend server..."
pkill -f "uvicorn" || pkill -f "python" || true
sleep 2
mkdir -p logs
echo "Installing dependencies..."
pip install -r requirements.txt
echo "Starting FastAPI server..."
nohup uvicorn main:app --host 0.0.0.0 --port 8000 --reload > logs/server.log 2>&1 &
SERVER_PID=$!
echo "FastAPI server started in background, PID: $SERVER_PID"
sleep 3
ps aux | grep $SERVER_PID || echo "Warning: Server process may have failed to start"
