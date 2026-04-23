# Dockerfile
FROM ghcr.io/openclaw/openclaw:latest

# Instalar @google/gemini-cli y uv
USER root
RUN npm install -g @google/gemini-cli

# Copiar binarios pre-descargados
COPY artifacts/gh.deb /tmp/gh.deb
COPY artifacts/uv /usr/local/bin/uv
COPY artifacts/uvx /usr/local/bin/uvx

# Instalar gh (GitHub CLI) localmente resolviendo dependencias
COPY artifacts/gh.deb /tmp/gh.deb
RUN apt-get update && apt-get install -y /tmp/gh.deb && rm /tmp/gh.deb && rm -rf /var/lib/apt/lists/*

RUN curl -LO "https://dl.k8s.io/release/v1.32.3/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    kubectl version --client

# Volvemos al usuario node para seguridad
USER node
