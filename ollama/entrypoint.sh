#!/bin/sh
# Levanta el servidor, baja el modelo SOLO si no está en el disco, y queda escuchando.
set -e
ollama serve &
PID=$!
until ollama list >/dev/null 2>&1; do sleep 1; done
ollama list | grep -q "^${OLLAMA_MODEL}" || ollama pull "$OLLAMA_MODEL"
wait $PID
