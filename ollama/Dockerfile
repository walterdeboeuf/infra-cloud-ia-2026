# Carga de IA propia: Ollama + llama3.2:1b, CPU-only.
# Pesos AFUERA de la imagen: se bajan una vez al volumen montado en /data.
FROM ollama/ollama:0.40.10

# Escuchar en todas las interfaces (el contenedor publica el 11434).
ENV OLLAMA_HOST=0.0.0.0:11434
# Pesos del modelo en el volumen / disco persistente, no en la imagen.
ENV OLLAMA_MODELS=/data/models
ENV OLLAMA_MODEL=llama3.2:1b

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 11434

# (healthy) recien cuando el modelo esta descargado y el servidor responde.
HEALTHCHECK --interval=10s --timeout=5s --start-period=60s --retries=30 \
  CMD ollama show "$OLLAMA_MODEL" >/dev/null || exit 1

ENTRYPOINT ["/entrypoint.sh"]
