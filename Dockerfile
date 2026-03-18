# Dockerfile
FROM ghcr.io/openclaw/openclaw:latest

# Instalar gemini-cli
USER root
RUN npm install -g gemini-cli

# Volvemos al usuario node para seguridad
USER node
