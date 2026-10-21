# Carga de IA propia (Lab 3): Ollama + llama3.2:1b, CPU-only.
FROM ollama/ollama:latest

# Escuchar en todas las interfaces y en el puerto que abre el módulo (app_port = 11434).
ENV OLLAMA_HOST=0.0.0.0:11434
# Pesos del modelo en el disco persistente: el módulo monta /mnt/disks/datos en /data.
ENV OLLAMA_MODELS=/data/models
ENV OLLAMA_MODEL=llama3.2:1b

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 11434
ENTRYPOINT ["/entrypoint.sh"]
