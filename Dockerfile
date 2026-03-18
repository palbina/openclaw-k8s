# Dockerfile
FROM ghcr.io/openclaw/openclaw:latest

# Instalar @google/gemini-cli y uv
USER root
RUN npm install -g @google/gemini-cli && \
    curl -LsSf https://astral.sh/uv/install.sh | sh

# Volvemos al usuario node para seguridad
USER node
