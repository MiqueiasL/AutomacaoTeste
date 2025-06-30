FROM n8nio/n8n:latest

# Instalar dependências necessárias
USER root
RUN apk add --no-cache curl

# Voltar para usuário n8n
USER node

# Definir variáveis de ambiente necessárias
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV NODE_ENV=production

# Expor a porta
EXPOSE 5678

# Comando de inicialização
CMD ["n8n", "start"]
